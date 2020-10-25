import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:iiitb_hogwarts/models/user.dart';
import 'package:iiitb_hogwarts/utils/important_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> login(String email, String password, User user) async {
  Uri uri = Uri.http(BASE_URL, LOGIN);
  Map body = {
    'email': email,
    'password': password
  };
  try {
    var res = await http.post(uri, body: body);
    print(res.toString());
    if(res.statusCode != 200) return null;
    var responseBody = jsonDecode(res.body);
    print(responseBody.toString());
    user.setUserDetails(responseBody['user']);
    var pref = await SharedPreferences.getInstance();
    bool prefResult = await pref.setString('userId', user.id);
    return prefResult;
  } catch(error) {
    print(error.toString());
    return false;
  }
}

Future<bool> register(String name, String email, String password, User user) async {
  Uri uri = Uri.http(BASE_URL, REGISTER);
  Map body = {
    'name': name,
    'email': email,
    'password': password
  };
  try {
    var res = await http.post(uri, body: body);
    if(res.statusCode != 200) return null;
    var responseBody = jsonDecode(res.body);
    user.setUserDetails(responseBody['user']);
    var pref = await SharedPreferences.getInstance();
    print('${user.id} ===== ${user.name}');
    bool prefResult = await pref.setString('userId', user.id);
    return prefResult;
  } catch(error) {
    print(error.toString());
    return false;
  }
}