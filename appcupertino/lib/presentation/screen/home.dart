import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Inicio',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Center(
          child: FilledButton(
            child: const Text('Hola mundo'),
            onPressed: () {},
          ),
        ));
  }
}
