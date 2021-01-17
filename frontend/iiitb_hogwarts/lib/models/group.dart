import 'package:iiitb_hogwarts/models/user.dart';

class Group {

  String id, name, groupLogo, tagline;
  int groupScore, numOfMembers;
  List<User> members;

  Group({this.id, this.name, this.groupLogo, this.tagline, this.groupScore, this.numOfMembers});

  Group.fromJson(jsonObject) {
    this.id = jsonObject['_id'];
    this.name = jsonObject['name'];
    this.groupLogo = jsonObject['group_logo'];
    this.tagline = jsonObject['tagline'];
    this.groupScore = jsonObject['group_score'];
    this.numOfMembers = jsonObject['numOfMembers'];
  }

}