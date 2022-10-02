import 'package:flutter/material.dart';

class MyThemes {
  static final primaryColor = Colors.blue.shade300;

  static final darkTheme = ThemeData(
    primaryColorDark: primaryColor,
    dividerColor: Colors.white
  );

  static final lightTheme = ThemeData(  
    primaryColor: primaryColor,
    dividerColor: Colors.black
  );
}