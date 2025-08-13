import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sg_grocery/theme/app_colors.dart';

import '../../../models/discount_coupon.dart';
import 'discount_coupon.dart';

class PromoSection extends StatelessWidget {
  final List<DiscountCouponData> coupons;

  const PromoSection({super.key, required this.coupons});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...coupons
            .map(
              (coupon) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: DiscountCoupon(
                  label: coupon.label,
                  discount: coupon.discount,
                  subtitle: coupon.subtitle,
                  footnote: coupon.footnote,
                  code: coupon.code,
                  backgroundColor:
                      coupon.backgroundColor ?? AppColors.themeGreen,
                ),
              ),
            )
            .toList(),
        const SizedBox(height: 8),
        Center(
          child: Text(
            'Promo code can be applied on \npayment screen',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0x9974CA82),
            ),
          ),
        ),
      ],
    );
  }
}
