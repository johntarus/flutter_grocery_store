import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_colors.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;
  final bool canDecrease;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onDecrease,
    required this.onIncrease,
    this.canDecrease = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: canDecrease ? onDecrease : null,
          child: SizedBox(
            height: 30,
            child: Image.asset(
              'assets/icons/larger_remove_cart_icon.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(width: 4),
        SizedBox(
          width: 20,
          child: Text(
            quantity.toString(),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.visible,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: AppColors.themeGreen,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: onIncrease,
          child: SizedBox(
            height: 30,
            child: Image.asset(
              'assets/icons/larger_add_cart_icon.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
