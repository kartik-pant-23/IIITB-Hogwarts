import 'package:flutter/cupertino.dart';
import 'package:iiitb_hogwarts/models/user.dart';
import 'package:provider/provider.dart';

class Chat {

  String userId, name, message;
  BuildContext _context;

  Chat({BuildContext context}) {
    this._context = context;
  }

  fromJson(jsonObject) {
    userId = jsonObject['userId'];
    name = jsonObject['name'];
    message = jsonObject['message'];
  }

  // Check if the message is from the user himself/ herself
  int getType() {
    /*String thisUserId = Provider.of<User>(_context).userId;
    return (thisUserId==userId) ?1 :0;*/
    return 1;
  }

}