import 'package:flutter/material.dart';

class CloseIcon extends StatelessWidget {
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final VoidCallback? onPressed;

  const CloseIcon({
    super.key,
    this.top,
    this.left,
    this.right,
    this.bottom,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: IconButton(
        icon: Image.asset('assets/icons/close_icon.png', height: 10),
        style: IconButton.styleFrom(padding: EdgeInsets.all(4)),
        onPressed: onPressed ?? () {},
      ),
    );
  }
}
