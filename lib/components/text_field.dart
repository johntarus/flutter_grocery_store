import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  const AuthTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppFonts.montserrat(color: AppColors.textSecondary),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColors.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColors.themeGreen),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
