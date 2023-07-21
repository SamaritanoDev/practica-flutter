import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xfff4008b);

  static final ThemeData lightTheme = ThemeData(
      //Color primario
      primaryColor: primary,

      //AppBar Theme
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),

      //TextButton Theme
      textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: primary)));
}
