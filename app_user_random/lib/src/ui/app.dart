import 'package:flutter/material.dart';

import 'user/widgets/custom_user_card.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User App',
      home: Scaffold(
        appBar: AppBar(title: const Text('User Details')),
        body: const Center(
          child: UserWidget(),
        ),
      ),
    );
  }
}

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomCard();
  }
}
