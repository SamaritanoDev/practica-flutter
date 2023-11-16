import 'package:flutter/material.dart';

class Ticket extends StatelessWidget {
  const Ticket({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite,
            color: Colors.purpleAccent,
          ),
          Text(
            'Aquí somos flutterinos',
            style: TextStyle(
              color: Colors.pink,
            ),
          ),
        ],
      ),
    );
  }
}
