import 'dart:html';
import 'package:app_landing_vertical/ui/views/views.dart';
import 'package:flutter/material.dart';
import 'package:app_landing_vertical/config/config.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeBody(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: appMenuItem.length,
      onPageChanged: (index) {
        final newPath = appMenuItem[index].link;
        final newTitle = appMenuItem[index].title;
        window.history.pushState(null, newTitle, newPath);
      },
      itemBuilder: (context, index) {
        final menuItem = appMenuItem[index];
        return _buildPage(menuItem.viewName);
      },
    );
  }

  Widget _buildPage(String viewName) {
    switch (viewName) {
      case HomeView.name:
        return const HomeView();
      case ContactView.name:
        return const ContactView();
      case LocationView.name:
        return const LocationView();
      // Agregar más casos aquí según sea necesario
      default:
        return const HomeView();
    }
  }
}
