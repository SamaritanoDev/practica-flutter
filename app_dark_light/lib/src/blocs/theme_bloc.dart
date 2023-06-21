import 'package:flutter/material.dart';

class ThemeBloc {
  ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.light);

  void toggleTheme(){
    themeMode.value = themeMode.value == ThemeMode.light 
    ? ThemeMode.dark
    : ThemeMode.light;
  }
}
