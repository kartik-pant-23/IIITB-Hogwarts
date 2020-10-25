import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/models/achievement.dart';

class User with ChangeNotifier {
  String _id = '';
  String _name = '';
  String _groupName = '';
  String _email = '';
  String _points = '';
  List<Achievement> _achievements = List();

  void setUserDetails(jsonObj){
    print(jsonObj['name']);
    _id = jsonObj['_id'];
    _name = jsonObj['name'] ?? '';
    _groupName = jsonObj['groupName'] ?? '';
    _email = jsonObj['email'] ?? '';
    _points = jsonObj['points'] ?? '';
    var ach_string = jsonObj['achievements'];
    _achievements = List();
    for(int i=0; i<ach_string.length; i++) {
      Achievement achievement = Achievement.fromJson(ach_string[i]);
      _achievements.add(achievement);
    }
    notifyListeners();
  }

  List<Achievement> get achievements => _achievements;

  String get points => _points;

  String get email => _email;

  String get groupName => _groupName;

  String get name => _name;

  String get id => _id;
}