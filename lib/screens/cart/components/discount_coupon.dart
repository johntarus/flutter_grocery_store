import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'close_icon.dart';
import 'middle_notch_clipper.dart';

class DiscountCoupon extends StatelessWidget {
  final String? label;
  final String discount;
  final String subtitle;
  final String footnote;
  final String code;
  final Color backgroundColor;
  final Color textColor;

  const DiscountCoupon({
    super.key,
    this.label,
    required this.discount,
    required this.subtitle,
    required this.footnote,
    required this.code,
    this.backgroundColor = const Color(0xFF5BBF6B),
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: ClipPath(
        clipper: MiddleNotchClipper(),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Coupon Container
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  // Left section
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (label != null)
                            Text(
                              label!,
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: textColor,
                              ),
                            ),
                          const SizedBox(height: 4),
                          Text(
                            discount,
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: textColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            subtitle,
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: textColor,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            footnote,
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Divider
                  Container(
                    width: 1,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    color: Colors.white.withOpacity(0.5),
                  ),

                  // Right section
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "code",
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: textColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            code,
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CloseIcon(top: -8, right: -8),
            CloseIcon(bottom: -8, right: -8),
            CloseIcon(top: -8, left: -8),
            CloseIcon(bottom: -8, left: -8),
          ],
        ),
      ),
    );
  }
}
