import 'package:flutter/material.dart';

class CircleMedia extends StatelessWidget {
  const CircleMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _FoooterCircleinter(),
          ),
        ),
      ),
    );
  }
}

class _FoooterCircleinter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(
      center: const Offset(150.0, 150.0),
      radius: 500,
    );
    const Gradient gradiente = LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.centerRight,
      colors: <Color>[
        Color(0xfff9bf9a),
        Color(0xfffbd4ba),
        Color(0xfff9bf9a),
        Color(0xfffbd4ba),
        Color(0xfff9bf9a),
      ],
    );
    final paint = Paint()..shader = gradiente.createShader(rect);

    final path = Path();

    //dibujar con el path y paint
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.55, size.width * 0.50, size.height * 0.55);
    path.quadraticBezierTo(size.width * 0.9, size.height * 0.55, size.width, size.height * 0.75);
    //los dos primeros coordenadas es el eje por donde pasa la curvatura
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
