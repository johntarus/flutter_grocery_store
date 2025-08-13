import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_colors.dart';
import 'payment_detail_row.dart';

class CartSummary extends StatelessWidget {
  final double totalMRP;
  final double discount;
  final double shippingCharges;
  final double total;
  final String? shippingText;

  const CartSummary({
    super.key,
    required this.totalMRP,
    this.discount = 0.0,
    this.shippingCharges = 0.0,
    required this.total,
    this.shippingText = 'Free',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment details',
          style: GoogleFonts.montserrat(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.darkColor,
          ),
        ),
        const SizedBox(height: 8),
        PaymentDetailRow(label: 'Total MRP', value: '\$$totalMRP'),
        PaymentDetailRow(
          label: 'Discount',
          value: '\$${discount.toStringAsFixed(2)}',
        ),
        PaymentDetailRow(
          label: 'Shipping Charges',
          value: shippingText ?? '\$${shippingCharges.toStringAsFixed(2)}',
        ),
        PaymentDetailRow(
          label: 'Total',
          value: '\$${total.toStringAsFixed(2)}',
          isTotal: true,
        ),
      ],
    );
  }
}
