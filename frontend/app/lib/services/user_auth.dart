import 'dart:convert';

import 'package:app/models/user_auth.dart';
import 'package:http/http.dart' as http;

const String URL_REGISTER = "";
const String URL_LOGIN = "";

Future<dynamic> registerStatus(Users user) async{
  var _body = jsonEncode(user.toMap());
  var response = await http.post(URL_REGISTER, headers: {'Content-Type':'application/json'},
  body: _body);
  return response.statusCode;
}

Future<dynamic> loginStatus(Users user) async{
  var _body = jsonEncode(user.toMap());
  var response = await http.post(URL_LOGIN, headers: {'Content-Type':'application/json'},
      body: _body);
  return response.statusCode;
}