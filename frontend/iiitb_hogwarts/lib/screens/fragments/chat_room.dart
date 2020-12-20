import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/models/chat.dart';
import 'package:iiitb_hogwarts/services/current_user.dart';
import 'package:iiitb_hogwarts/widgets/chat_item.dart';
import 'package:iiitb_hogwarts/widgets/chat_screen_header.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {

  final List<Chat> chatData = List();
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    for(int i=0; i<20; i++) {
      Chat chat = Chat(context: context);
      chat.fromJson({
        'userId': 'akhskabxcywb1921y78sgqsb',
        'name': 'Kartik',
        'message': 'Lorem Ipsum '
      });
      chatData.add(chat);
    }

    return Center(
      child: Column(
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
              reverse: true,
              itemCount: chatData.length,
              itemBuilder: (context, index) {
                return ChatItem(chat: chatData[index]);
              },
            ),
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
                    onTap: () {})
              ],
            ),
          )
        ],
      )
    );
  }
}