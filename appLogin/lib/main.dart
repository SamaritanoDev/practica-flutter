import 'package:appcupertino/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'config/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Hola mundo',
      routerConfig: appRouter,
      // initialRoute: 'splash',
      theme: AppTheme(selectedColor: 3).getMyTheme(),
    );
  }
}
