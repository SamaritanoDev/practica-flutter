import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BarbieDataScreen extends StatelessWidget {
  static const String name = '/barbie_data_screen';
  const BarbieDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            GoRouter.of(context).go('/home_screen');
          },
        ),
      ),
      body: const Center(
        child: Text('Hello Barbie data science'),
      ),
    );
  }
}
