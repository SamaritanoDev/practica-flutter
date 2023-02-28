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
      initialRoute: 'splash',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
            brightness: Brightness.dark,
            primary: ColorsMyApp.secondarycolor,
            onPrimary: ColorsMyApp.optionalcolor,
            secondary: ColorsMyApp.primarycolor,
            onSecondary: ColorsMyApp.tertiarycolor,
            error: ColorsMyApp.errorcolor,
            onError: ColorsMyApp.onErrorcolor,
            background: ColorsMyApp.backgroundcolor,
            onBackground: ColorsMyApp.onbackgroundcolor,
            surface: ColorsMyApp.surfacecolor,
            onSurface: ColorsMyApp.onsurfacecolor),
      ),
      routes: {
        'splash': (context) => const LoadingScreen(),
        'login': (context) => const RegisterScreen(),
        'register': (context) => const LoginScreen(),
      },
    );
  }
}
