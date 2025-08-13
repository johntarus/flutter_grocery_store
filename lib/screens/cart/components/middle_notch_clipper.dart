import 'package:flutter/material.dart';

class MiddleNotchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double notchRadius = 10;
    double separatorX = size.width * 0.66;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(separatorX - notchRadius, 0);

    // Top notch
    path.arcToPoint(
      Offset(separatorX + notchRadius, 0),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(separatorX + notchRadius, size.height);

    // Bottom notch
    path.arcToPoint(
      Offset(separatorX - notchRadius, size.height),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );

    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
