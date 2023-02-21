import 'package:appcupertino/screen/screens.dart';
import 'package:flutter/material.dart';

import 'const/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hola mundo',
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: ColorsMyApp.secondarycolor),
      home: const LoadingScreen(),
    );
  }
}
