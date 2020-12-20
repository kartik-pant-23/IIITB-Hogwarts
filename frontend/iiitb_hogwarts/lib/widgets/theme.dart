import 'package:flutter/material.dart';

ThemeData ourTheme() {

  Map<int, Color> _swatchColor = {
    50: Color.fromRGBO(96, 12, 92, 0.9),
    100: Color.fromRGBO(96, 12, 92, 1),
    200: Color.fromRGBO(72, 9, 69, 0.9),
    300: Color.fromRGBO(72, 9, 69, 1),
    400: Color.fromRGBO(48, 6, 46, 0.9),
    500: Color.fromRGBO(48, 6, 46, 1),
    600: Color.fromRGBO(24, 3, 23, 0.9),
    700: Color.fromRGBO(24, 3, 23, 1),
    800: Color.fromRGBO(0, 0, 0, 0.9),
    900: Color.fromRGBO(0, 0, 0, 1),
  };

  var data = ThemeData(
    primarySwatch: MaterialColor(0xFF40184B, _swatchColor),
    accentColor: Color(0xFFDF267C),
    primaryColor: Color(0xFF40184B),
    scaffoldBackgroundColor: Color(0xFF480945),
    brightness: Brightness.dark,
    fontFamily: "Poppins",
  );

  return data;
}