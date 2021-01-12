import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/models/chat.dart';
import 'package:iiitb_hogwarts/models/user.dart';
import 'package:provider/provider.dart';

class ChatItem extends StatelessWidget {
  final Chat chat;
  final bool skipHeader;

  ChatItem({@required this.chat, this.skipHeader = false});

  @override
  Widget build(BuildContext context) {
    if (chat.userId == null) return Container();

    int type = chat.getType(Provider.of<User>(context).userId);

    MainAxisAlignment msgAlignment =
        (type == 1) ? MainAxisAlignment.end : MainAxisAlignment.start;
    Color containerColor = (type == 1) ? Color(0xFFDF267C) : Color(0xFFDF267C).withOpacity(0.2);
    Color textColor = (type == 1) ? Color(0xFFFFFFFF) : Color(0xFFFFFFFF);

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: msgAlignment,
      children: [
        Container(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.80),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
          decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Color(0xFFDF267C), width: 2)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (type == 0 && !skipHeader)
                  ? Text(chat.name,
                      style: TextStyle(
                          color: Color(0xFFDF267C), fontWeight: FontWeight.bold),
                      textScaleFactor: 1.6)
                  : Container(width: 0),
              Text(
                chat.message,
                style: TextStyle(color: textColor),
                textScaleFactor: 1.3,
              )
            ],
          ),
        )
      ],
    );
  }
}
