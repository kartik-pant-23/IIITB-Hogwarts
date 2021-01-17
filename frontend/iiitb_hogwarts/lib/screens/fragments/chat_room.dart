import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';
import 'package:iiitb_hogwarts/models/chat.dart';
import 'package:iiitb_hogwarts/models/home_page_data.dart';
import 'package:iiitb_hogwarts/models/user.dart';
import 'package:iiitb_hogwarts/widgets/chat_item.dart';
import 'package:provider/provider.dart';

class ChatRoom extends StatefulWidget {

  final model;
  final int type;
  ChatRoom({@required this.model, @required this.type});

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  SocketIO socket;

  final List<Chat> chatData = HomePageData().discussion.chat;
  final TextEditingController textController = TextEditingController();

  Stream msgStream;
  StreamController controller;

  bool isDisc = false;

  @override
  void initState() {
    isDisc = (widget.type==1);
    socket = SocketIOManager().createSocketIO(
        'http://192.168.18.8:3000',
        (isDisc) ?'/discussion' :'/group',
        query: "roomId=${widget.model.id}");
    socket.init();

    socket.subscribe('receive_message', (data) {
      Chat chat = Chat.fromJson(jsonDecode(data));
      chatData.add(chat);
      HomePageData().discussion.chat.add(chat);
      controller.add(chatData);
    });

    socket.connect();

    controller = StreamController();
    msgStream = controller.stream;
    super.initState();
  }

  @override
  void dispose() {
    socket.disconnect();
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final User user = Provider.of<User>(context);

    return Center(
        child: Column(
        children: [
          Flexible(
              fit: FlexFit.loose,
              child: StreamBuilder(
                initialData: chatData,
                stream: msgStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    List<Chat> msgList = List.from(chatData.reversed);
                    return ListView.builder(
                        reverse: true,
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                        itemCount: msgList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ChatItem(chat: msgList[index]),
                              (index != 0 &&
                                      msgList[index - 1].userId !=
                                          msgList[index].userId)
                                  ? SizedBox(height: 8)
                                  : Container()
                            ],
                          );
                        });
                  }
                  return Container();
                },
              )),
          Container(
            constraints: BoxConstraints(maxHeight: 150),
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            decoration: BoxDecoration(
                color: Color(0xFFDF267C).withOpacity(0.30),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x55000000),
                      offset: Offset(0, 0),
                      blurRadius: 8)
                ]),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    maxLines: null,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                BorderSide(color: Color(0xFFDF267C), width: 2.5)),
                        hintText: 'Type something...'),
                  ),
                ),
                SizedBox(width: 4),
                GestureDetector(
                    child: Icon(Icons.send_rounded, color: Color(0xFFDF267C)),
                    onTap: () async {
                      if (textController.text != null &&
                          textController.text.trim() != '') {
                        Chat chat = Chat(
                          userId: user.userId,
                          name: user.name,
                          message: textController.text.trim()
                        );
                        socket.sendMessage('send_message', jsonEncode(chat.toJson()));
                        textController.clear();
                        chatData.add(chat);
                        HomePageData().discussion.chat.add(chat);
                        controller.add(chatData);
                      }
                    })
              ],
            ),
          )
      ],
    ));
  }
}
