import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/models/blog.dart';
import 'package:iiitb_hogwarts/models/discussion.dart';
import 'package:iiitb_hogwarts/models/group.dart';
import 'package:iiitb_hogwarts/services/load_data.dart';

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

  Future<bool> init(BuildContext context) async {
    bool result = await DataLoader().loadData();
    return result;
  }

}
