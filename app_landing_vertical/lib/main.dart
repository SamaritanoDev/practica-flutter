import 'package:app_landing_vertical/config/config.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Samaritanodev',
      theme: AppTheme(selectedColor: 1).getTheme(),
      routerConfig: appRouter,
    );
  }
}
