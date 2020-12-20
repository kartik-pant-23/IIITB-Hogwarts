import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/models/achievement.dart';

class User {

  String userId;
  String firstName;
  String lastName;
  String email;
  String groupId;

  fromJson(jsonObject) {
    userId = jsonObject['_id'];
    firstName = jsonObject['firstName'];
    lastName = jsonObject['lastName'];
    email = jsonObject['email'];
    groupId = jsonObject['groupId'];
  }

}