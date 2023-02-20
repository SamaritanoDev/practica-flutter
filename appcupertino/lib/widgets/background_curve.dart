import 'package:flutter/material.dart';

import '../const/colors.dart';

class Fondo extends StatelessWidget {
  final Widget child;
  const Fondo({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: CustomPaint(
            painter: _FondoPainter(),
          ),
        ),
        Align(
          child: child,
        ),
      ],
    );
  }
}

class _FondoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //propiedades del lapiz
    paint.color = ColorsMyApp.secondarycolor;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 15;

    final path = Path();
    //Drawing a path top.
    path.lineTo(0, size.height * 0.15);
    path.quadraticBezierTo(size.width * 0.10, size.height * 0.30,
        size.width * 0.35, size.height * 0.12);
    path.quadraticBezierTo(size.width * 0.42, size.height * 0.08,
        size.width * 0.50, size.height * 0.12);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.25, size.width, size.height * 0.12);
    path.lineTo(size.width, 0);

    /// Drawing a path bottom.
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.80);
    path.quadraticBezierTo(size.width * 0.22, size.height * 0.65,
        size.width * 0.50, size.height * 0.82);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.95,
        size.width * 0.88, size.height * 0.86);
    path.quadraticBezierTo(
        size.width * 0.91, size.height * 0.84, size.width, size.height * 0.80);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
    //throw UnimplementedError();
  }
}
