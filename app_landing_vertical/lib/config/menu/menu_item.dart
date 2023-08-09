import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String? subTitle;
  final String link;
  final IconData? icon;
  final int index;

  const MenuItem({
    required this.title,
    this.subTitle,
    required this.link,
    this.icon,
    required this.index,
  });
}

const appMenuItem = <MenuItem>[
  MenuItem(
    title: 'HomeView',
    link: '/homeview',
    index: 0,
  ),
  MenuItem(
    title: 'ContactView',
    link: '/contactview',
    index: 1,
  ),
];
