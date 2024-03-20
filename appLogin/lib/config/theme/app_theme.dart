import 'package:flutter/material.dart';

const List<Color> colorList = [
  Color(0xFFc195d9),
  Color(0xff04ffb0),
  Color(0xffb221e7),
  Color(0xFF381354),
  Color(0xffef081f),
  Color(0xff0bfcdc),
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Selected color must be greater then 0'),
        assert(selectedColor < colorList.length, 'Selected color must be less or equal than ${colorList.length - 1}');

  ThemeData getMyTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: false));
}
