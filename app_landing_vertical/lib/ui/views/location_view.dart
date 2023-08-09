import 'package:flutter/material.dart';

class LocationView extends StatelessWidget {
  static const String name = 'location_view';

  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: const Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'Location',
            style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
