import 'package:flutter/material.dart';
import 'package:widgetoftheweek/widgets/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RatingBar',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.purple,
      ),
      home: const Scaffold(
        body: RatingBarEmoji(),
      ),
    );
  }
}
