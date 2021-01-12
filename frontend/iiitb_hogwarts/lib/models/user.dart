import 'package:iiitb_hogwarts/models/chat.dart';

class User {

  String name, email, userId, group;
  int score;
  List<Chat> groupChat;
  String about, facebook, instagram, github, twitter, linkedId, youtube, personal;

  User({this.userId, this.name, this.email, this.group, this.score, this.groupChat});

  User.fromJson(jsonObject) {
    var userData = jsonObject['user'] ?? jsonObject;
    this.userId = userData['_id'];
    this.name = userData['name'];
    this.email = userData['email'];
    this.group = userData['group'];
    this.score = userData['score'];
    this.about = userData['about'];
    this.facebook = userData['id_facebook'];
    this.instagram = userData['id_instagram'];
    this.linkedId = userData['id_linkedin'];
    this.github = userData['id_github'];
    this.twitter = userData['id_twitter'];
    this.youtube = userData['id_youtube'];
    this.personal = userData['id_personal'];

    var chatData = jsonObject['chat_data'] ?? [];
    this.groupChat = List();
    for(int i=0; i<chatData.length; i++) {
      Chat chat = Chat.fromJson(chatData[i]);
      groupChat.add(chat);
    }
  }

  Map<String, String> toJson() {
    return {
      "about": this.about,
      "id_facebook": this.facebook,
      "id_instagram": this.instagram,
      "id_linkedin": this.linkedId,
      "id_github": this.github,
      "id_twitter": this.twitter,
      "id_youtube": this.youtube,
      "id_personal": this.personal,
    };
  }
  
  // Tells if it is the current user
  int getType(String userId) {
    return (this.userId==userId) ?1 :0;
  }

}