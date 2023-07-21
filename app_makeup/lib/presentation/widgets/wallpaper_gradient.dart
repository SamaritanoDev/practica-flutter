import 'package:flutter/material.dart';

class WallpaperGradient extends StatelessWidget {
  const WallpaperGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.01, 0.3, 0.8],
          colors: [
            Color(0xfff4008b),
            Color(0xffff7ac4),
            Color.fromARGB(255, 253, 250, 249),
          ],
        ),
      ),
    );
  }
}
