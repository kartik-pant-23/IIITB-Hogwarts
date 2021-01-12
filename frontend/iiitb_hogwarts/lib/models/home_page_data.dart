import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/models/blog.dart';
import 'package:iiitb_hogwarts/models/discussion.dart';
import 'package:iiitb_hogwarts/models/group.dart';
import 'package:iiitb_hogwarts/models/user.dart';
import 'package:iiitb_hogwarts/services/chat_handler.dart';
import 'package:iiitb_hogwarts/services/load_data.dart';
import 'package:provider/provider.dart';

class HomePageData {

  static HomePageData _homePage;

  HomePageData._createInstance();

  factory HomePageData() {
    if(_homePage==null) {
      _homePage = HomePageData._createInstance();
    }
    return _homePage;
  }

  List<Group> groups;
  List<Blog> blogs;
  Discussion discussion;
  ChatHandler chatHandler;

  Future<bool> init(BuildContext context) async {
    bool result = await DataLoader().loadData();
    /*String roomId = Provider.of<User>(context, listen: false).group;
    String type = "group";
    chatHandler = ChatHandler(
        roomId: roomId,
        type: type
    );
    chatHandler.initChat();*/
    return result;
  }

  void dispose() {
    chatHandler.disconnect();
  }

}
