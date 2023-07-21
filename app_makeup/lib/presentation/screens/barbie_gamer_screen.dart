import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BarbieGamerScreen extends StatelessWidget {
  static const String name = '/barbie_gamer_screen';
  const BarbieGamerScreen({super.key});

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
        child: Text('Hello Barbie Gamer'),
      ),
    );
  }
}
