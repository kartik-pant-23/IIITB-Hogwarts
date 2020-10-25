import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:iiitb_hogwarts/utils/important_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> getUser() async {
  var pref = await SharedPreferences.getInstance();
  String id = pref.getString('userId');
  if(id!=null) {
    Uri uri = Uri.http(BASE_URL, 'users/$id');
    var res = await http.get(uri);
    if(res.statusCode != 200) return false;
    User user = User();
    user.setUserDetails(jsonDecode(res.body));
    return true;
  }
  return false;
}