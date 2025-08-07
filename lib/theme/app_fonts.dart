import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static TextStyle montserrat({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
  }) {
    return GoogleFonts.montserrat(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
