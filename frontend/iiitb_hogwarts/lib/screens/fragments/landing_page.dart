import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/screens/fragments/chat_room.dart';
import 'package:iiitb_hogwarts/screens/fragments/group.dart';
import 'package:iiitb_hogwarts/screens/fragments/profile.dart';

class LandingPage extends StatelessWidget {

  final String type;
  final model;
  LandingPage({@required this.type, @required this.model});

  @override
  Widget build(BuildContext context) {

    Map<String, String> title = {
      "group": 'Group Info',
      "user_profile": 'User Profile',
      "chat": 'Discussion Room'
    };

    Widget showPage() {
      switch(type) {
        case 'group':
          return GroupInfo(group: model);
          break;
        case 'user_profile':
          return Profile();
          break;
        case 'chat':
          return ChatRoom();
          break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Color(0xFF480945),
        title: Text(title[type]),
        centerTitle: true,
      ),
      body: showPage(),
    );
  }
}
