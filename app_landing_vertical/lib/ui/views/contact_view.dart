import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  static const String name = 'contact_view';
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: const Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'Contact',
            style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
