import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_colors.dart';

Widget buildTransactionGroup(
  String date,
  String title,
  String transactionId,
  double amount,
  bool isPositive,
) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Timeline line & dot
      Container(
        width: 40,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF4CAF50), width: 2),
                color: Colors.white,
              ),
            ),
            Container(width: 2, height: 120, color: const Color(0xFF4CAF50)),
          ],
        ),
      ),

      // Date & card
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 2),
            Text(
              date,
              style: GoogleFonts.montserrat(
                fontSize: 18,
                color: AppColors.darkColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 22),
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: AppColors.darkColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Transaction Id : $transactionId",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF878787),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${isPositive ? '+' : '-'}\$$amount",
                    style: GoogleFonts.montserrat(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: isPositive
                          ? AppColors.themeGreen
                          : Color(0xFFEC1313),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
