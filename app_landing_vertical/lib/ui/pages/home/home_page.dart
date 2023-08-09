import 'dart:html';

import 'package:app_landing_vertical/ui/views/views.dart';
import 'package:flutter/material.dart';
import 'package:app_landing_vertical/config/config.dart';

class HomeScreen extends StatelessWidget {
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
        window.history.pushState(null, newTitle, newPath); // Actualizar la URL
      },
      itemBuilder: (context, index) {
        return appMenuItem[index].index == 0 ? const HomeView() : const ContactView();
      },
    );
  }
}
