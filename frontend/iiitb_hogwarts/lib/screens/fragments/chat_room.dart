import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/models/chat.dart';
import 'package:iiitb_hogwarts/services/chat_handler.dart';
import 'package:iiitb_hogwarts/services/current_user.dart';
import 'package:iiitb_hogwarts/widgets/chat_item.dart';
import 'package:iiitb_hogwarts/widgets/group_screen_header.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {

  final List<Chat> chatData = List();
  final TextEditingController textController = TextEditingController();

  Stream msgStream;
  StreamController controller;

  @override
  void initState() {
    controller = StreamController();
    msgStream = controller.stream;
    super.initState();
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

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
                      padding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 4),
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
            )
          ),
          Container(
            constraints: BoxConstraints(maxHeight: 150),
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            decoration: BoxDecoration(color: Color(0xFFDF267C).withOpacity(0.30), boxShadow: [
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
                            borderSide: BorderSide(
                                color: Color(0xFFDF267C),
                                width: 2.5)),
                        hintText: 'Type something...'),
                  ),
                ),
                SizedBox(width: 4),
                GestureDetector(
                    child: Icon(Icons.send_rounded,
                        color: Color(0xFFDF267C)),
                    onTap: () {
                      if(textController.text!=null && textController.text.trim()!='') {
                        textController.clear();
                        controller.add(chatData);
                      }
                    })
              ],
            ),
          )
        ],
      )
    );
  }
}