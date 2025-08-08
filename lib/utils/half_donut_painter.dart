import 'dart:math' as math;

import 'package:flutter/material.dart';

class HalfDonutPainter extends CustomPainter {
  final Color outerColor;
  final Color innerColor;

  HalfDonutPainter({required this.outerColor, required this.innerColor});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 3, size.height);

    final outerRadius = size.width / 3;
    final innerRadius = outerRadius - 45;

    final outerPaint = Paint()..color = outerColor;
    final innerPaint = Paint()..color = innerColor;

    // outer semi-circle
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: outerRadius),
      math.pi,
      math.pi,
      true,
      outerPaint,
    );

    // inner semi-circle
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: innerRadius),
      math.pi,
      math.pi,
      true,
      innerPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
