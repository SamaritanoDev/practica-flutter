import 'package:flutter/material.dart';

import '../../config/menu/menu_item.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Flutter + Material 3',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: const _HomeView());
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        //rebote
        physics: const BouncingScrollPhysics(),
        itemCount: appMenuItem.length,
        itemBuilder: (context, idenx) {
          final menuItem = appMenuItem[idenx];

          return _CustomListTile(menuItem: menuItem);
        });
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: color.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: color.primary),
      onTap: (){
        // TODO: navegar a otra pantalla
      },
    );
  }
}
