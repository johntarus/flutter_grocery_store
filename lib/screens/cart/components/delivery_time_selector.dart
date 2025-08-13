import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_colors.dart';

class DeliveryTimeSelector extends StatelessWidget {
  final String timeSlot;
  final VoidCallback? onTap;

  const DeliveryTimeSelector({super.key, required this.timeSlot, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            timeSlot,
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.darkColor,
            ),
          ),
          Image.asset('assets/icons/arrow_down.png', height: 20),
        ],
      ),
    );
  }
}
