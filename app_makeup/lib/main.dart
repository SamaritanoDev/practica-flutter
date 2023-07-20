import 'package:app_makeup/presentation/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStatePropertyAll(Color(0xfffcd1b6)),
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
