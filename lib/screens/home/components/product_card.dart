import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_colors.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String? discount;
  final Color? backgroundColor;

  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    this.discount,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.themeGreenLight,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 6),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 18,
              left: 18,
              right: 18,
              bottom: 12,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Image.asset(image, fit: BoxFit.contain, height: 100),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "\$$price",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkColor,
                  ),
                ),
              ],
            ),
          ),
          if (discount != null)
            Positioned(
              top: 10,
              left: 0,
              child: Container(
                padding: const EdgeInsets.only(
                  right: 20,
                  top: 4,
                  left: 6,
                  bottom: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.themeGreen,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Text(
                  discount!,
                  style: GoogleFonts.montserrat(
                    color: AppColors.white,
                    fontSize: 14,
                    height: 1.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
