import 'package:app/screens/login.dart';
import 'package:app/widgets/Theme.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: homeWidget(),
      theme: ourTheme(),
    );
  }
}

Widget homeWidget() {
  if(userLoggedIn()) {
    return HomePage();
  } else {
    return LoginPage();
  }
}

bool userLoggedIn(){
  return false;
}