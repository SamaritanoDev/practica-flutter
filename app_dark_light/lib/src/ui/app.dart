import 'package:app_dark_light/src/blocs/theme_bloc.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  final themeBloc = ThemeBloc();
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeBloc.themeMode,
      builder: (context, mode, _) {
        return MaterialApp(
            theme: mode == ThemeMode.light 
            ? ThemeData.light() 
            : ThemeData.dark(),
            home: Scaffold(
              body: const Center(
                child: Text(
                  'Hello, flutterinos!',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => (themeBloc.toggleTheme()),
                child: const Icon(Icons.brightness_4),
              ),
            ));
      },
    );
  }
}
