import 'package:flutter/material.dart';

class BarbieMobileScreen extends StatelessWidget {
  static const String name = '/barbie_mobile_screen';
  const BarbieMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Center(
        child: Text('Hello Barbie'),
      ),
    );
  }
}
