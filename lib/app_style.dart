import 'package:flutter/material.dart';

Color primary = Color.fromARGB(255, 0, 0, 0);
Color text = const Color.fromARGB(255, 253, 253, 255);
Color text2 = const Color.fromARGB(255, 185, 185, 196);
Color second = const Color.fromARGB(255, 39, 42, 78);
Color action = const Color.fromARGB(255, 255, 0, 103);
TextStyle fontSizeOne =
    const TextStyle(fontSize: 18, color: Color.fromARGB(255, 253, 253, 255));
TextStyle fontSizeTow = const TextStyle(
    fontSize: 36,
    color: Color.fromARGB(255, 253, 253, 255),
    fontWeight: FontWeight.bold);

class Alldata {
  static Color primaryColor = primary;
  static Color secondColor = second;
  static Color actionColor = action;
  static Color txtColor = text;
  static Color secondTxtColor = text2;
  static TextStyle textSizeOne = fontSizeOne;
  static TextStyle textSizeTow = fontSizeTow;
}

// Reminder App Create Theme
Color blueHeaderClr = const Color(0xFF303CE0);
Color pinkHeaderClr = const Color(0xFFE03073);
Color yellowHeaderClr = const Color(0xFFE0B730);
Color primaryClr = blueHeaderClr;

Color darkGrayClr = const Color(0xFF121212);
Color darkHeaderClr = const Color(0xFF424242);

class Themes {
  static final light = ThemeData(
    backgroundColor: Colors.white,
    primaryColor: primaryClr,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    backgroundColor: darkGrayClr,
    primaryColor: darkHeaderClr,
    brightness: Brightness.dark,
  );
}
