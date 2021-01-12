import 'package:iiitb_hogwarts/models/chat.dart';

class Discussion {
  String id;
  String bannerUrl;
  String title;
  List<Chat> chat;

  Discussion({this.id, this.bannerUrl, this.title, this.chat});

  Discussion.fromJson(jsonObject) {
    this.id = jsonObject['_id'];
    this.bannerUrl = jsonObject['banner_url'];
    this.title = jsonObject['discussion_title'];

    var chatData = jsonObject['chat'];
    this.chat = List();
    for(int i=0; i<chatData.length; i++) {
      Chat chatItem = Chat.fromJson(chatData[i]);
      chat.add(chatItem);
    }
  }
}
