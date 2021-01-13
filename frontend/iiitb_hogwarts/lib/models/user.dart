import 'package:iiitb_hogwarts/models/blog.dart';
import 'package:iiitb_hogwarts/models/chat.dart';
import 'package:iiitb_hogwarts/models/group.dart';

class User {

  String name, email, userId;
  int score;
  String about, facebook, instagram, github, twitter, linkedId, youtube, personal;
  Group group;
  List<Blog> blogs;

  User({this.userId, this.name, this.email, this.group, this.score});

  User.fromJson(jsonObject) {
    this.userId = jsonObject['_id'];
    this.name = jsonObject['name'];
    this.email = jsonObject['email'];
    this.group = Group.fromJson(jsonObject['group'] ?? {});
    this.score = jsonObject['score'];
    this.about = jsonObject['about'];
    this.facebook = jsonObject['id_facebook'];
    this.instagram = jsonObject['id_instagram'];
    this.linkedId = jsonObject['id_linkedin'];
    this.github = jsonObject['id_github'];
    this.twitter = jsonObject['id_twitter'];
    this.youtube = jsonObject['id_youtube'];
    this.personal = jsonObject['id_personal'];
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

  bool hasNoSocialMedia() {
    return this.facebook.isEmpty &&
    this.instagram.isEmpty &&
    this.github.isEmpty &&
    this.linkedId.isEmpty &&
    this.twitter.isEmpty &&
    this.youtube.isEmpty &&
    this.personal.isEmpty;
  }

  // Tells if it is the current user
  bool isCurrentUser(String userId) {
    return (this.userId==userId);
  }

}