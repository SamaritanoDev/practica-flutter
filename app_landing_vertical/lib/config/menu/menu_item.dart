import 'package:app_landing_vertical/ui/views/views.dart';
import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String? subTitle;
  final String link;
  final IconData? icon;
  final int index;
  final String viewName;

  const MenuItem(
      {required this.title, this.subTitle, required this.link, this.icon, required this.index, required this.viewName});
}

const appMenuItem = <MenuItem>[
  MenuItem(
    title: 'HomeView',
    link: '/homeview',
    index: 0,
    viewName: HomeView.name,
  ),
  MenuItem(
    title: 'ContactView',
    link: '/contactview',
    index: 1,
    viewName: ContactView.name,
  ),
  MenuItem(
    title: 'LocationView',
    link: '/locationview',
    index: 2,
    viewName: LocationView.name,
  ),
];
