import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class Grand extends StatefulWidget {
  const Grand({Key? key}) : super(key: key);

  @override
  State<Grand> createState() => _GrandState();
}

class _GrandState extends State<Grand> {
  late ConfettiController _controllerCenter;

  @override
  void initState() {
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenter.play();
    super.initState();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
      confettiController: _controllerCenter,
      blastDirectionality: BlastDirectionality.explosive,
      particleDrag: 0.05,
      emissionFrequency: 0.05,
      numberOfParticles: 50,
      gravity: 0.05,
      shouldLoop: true,
      colors: const [
        Colors.cyan,
        Colors.amberAccent,
        Colors.pink,
        Colors.indigo,
        Colors.purple
      ], // manually specify the colors to be used
    );
  }
}
