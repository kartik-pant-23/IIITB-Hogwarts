import 'package:flutter/material.dart';
import 'package:app/screens/home.dart';
import 'package:app/screens/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: homeWidget(),
    );
  }
}

Widget homeWidget() {
  if(userLoggedIn()) {
    return HomePage();
  } else {
    return RegisterPage();
  }
}

bool userLoggedIn(){
  return true;
}