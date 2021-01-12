import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iiitb_hogwarts/models/blog.dart';
import 'package:iiitb_hogwarts/models/user.dart';
import 'package:iiitb_hogwarts/models/discussion.dart';
import 'package:iiitb_hogwarts/models/group.dart';
import 'package:iiitb_hogwarts/models/home_page_data.dart';
import 'package:iiitb_hogwarts/utils/important_strings.dart';

class DataLoader {

  Future<bool> loadData() async {
    try {
      Uri uri = Uri.https(BASE_URL, HOME);
      var response = await http.get(uri);
      if (response.statusCode != 200) {
        print("ErrorLoadingHomePage: " + response.body);
        return false;
      }

      HomePageData homePage = HomePageData();

      List<Group> groupsList = List();
      var _groupsData = jsonDecode(response.body)['groups'];
      for (int i = 0; i < _groupsData.length; i++) {
        Group group = Group.fromJson(_groupsData[i]);
        groupsList.add(group);
      }

      List<Blog> blogsList = List();
      var _blogsData = jsonDecode(response.body)['blogs'];
      for (int i = 0; i < _blogsData.length; i++) {
        Blog blog = Blog.fromJson(_blogsData[i]);
        blogsList.add(blog);
      }

      var _discussionData = jsonDecode(response.body)['discussions'][0];
      Discussion discussion = Discussion.fromJson(_discussionData);

      homePage.groups = groupsList;
      homePage.blogs = blogsList;
      homePage.discussion = discussion;

      return true;
    } catch (err) {
      print("ErrorLoadingHomePage: " + err.toString());
      return false;
    }
  }

  Future<List<User>> getUsersList(Group group) async {
    try {
      Uri uri = Uri.https(BASE_URL, '$GROUPS/${group.id}');
      var response = await http.get(uri);
      if(response.statusCode != 200) {
        print("LoadingUsersList: "+response.body);
        return null;
      }
      var data = jsonDecode(response.body)['data'];
      var groupDetails = data['groupDetails'];
      var memberDetails = data['members'];

      group = Group.fromJson(groupDetails);

      List<User> usersList = List();
      for(int i=0; i<memberDetails.length; i++) {
        User user = User.fromJson(memberDetails[i]);
        usersList.add(user);
      }

      return usersList;

    } catch(err) {
      print("LoadingUsersList: "+err.toString());
      return null;
    }
  }

}