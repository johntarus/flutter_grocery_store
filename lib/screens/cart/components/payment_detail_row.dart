// Payment Detail Row
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_colors.dart';

class PaymentDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const PaymentDetailRow({
    super.key,
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 14),
      decoration: BoxDecoration(
        color: isTotal ? const Color(0xFFDCFFE2) : Colors.transparent,
        borderRadius: isTotal ? BorderRadius.circular(8) : BorderRadius.zero,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: GoogleFonts.montserrat(
                fontSize: isTotal ? 18 : 16,
                color: isTotal ? Color(0xFF434343) : AppColors.greyColor,
                fontWeight: isTotal ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            Text(
              value,
              style: GoogleFonts.montserrat(
                fontSize: 18,
                color: isTotal ? Color(0xFF434343) : AppColors.greyColor,
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
