import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_colors.dart';

class PaymentMethodSection extends StatelessWidget {
  final VoidCallback onAddNewCard;

  const PaymentMethodSection({super.key, required this.onAddNewCard});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: onAddNewCard,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.add_circle_outline, color: Color(0xFF4CAF50)),
            const SizedBox(width: 8),
            Text(
              'Add New Card',
              style: GoogleFonts.montserrat(
                color: AppColors.themeGreen,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
