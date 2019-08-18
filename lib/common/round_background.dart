import 'package:flutter/material.dart';

class RoundBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.amber;
    canvas.drawCircle(
        Offset(size.width / 2, size.height * 0.2), size.height * 0.4, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
