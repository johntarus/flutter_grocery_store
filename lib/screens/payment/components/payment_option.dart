import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_colors.dart';

class PaymentOption extends StatelessWidget {
  final String method;
  final bool isSelected;
  final ValueChanged<String> onChanged;

  const PaymentOption({
    super.key,
    required this.method,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.themeGreenLight : const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: RadioListTile<String>(
        title: Text(
          method,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: isSelected ? AppColors.themeGreen : const Color(0xFF7E7E7E),
          ),
        ),
        value: method,
        groupValue: isSelected ? method : '',
        onChanged: (value) => onChanged(value!),
        activeColor: const Color(0xFF4CAF50),
      ),
    );
  }
}
