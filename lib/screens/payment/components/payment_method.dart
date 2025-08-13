import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sg_grocery/screens/payment/components/payment_option.dart';

import '../../../theme/app_colors.dart';

class PaymentMethodSection extends StatefulWidget {
  const PaymentMethodSection({super.key});

  @override
  State<PaymentMethodSection> createState() => _PaymentMethodSectionState();
}

class _PaymentMethodSectionState extends State<PaymentMethodSection> {
  String selectedPaymentMethod = 'Credit / Debit Card';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose payment method',
          style: GoogleFonts.montserrat(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: AppColors.darkColor,
          ),
        ),
        const SizedBox(height: 16),
        // Payment Options
        PaymentOption(
          method: 'Cash On Delivery',
          isSelected: selectedPaymentMethod == 'Cash On Delivery',
          onChanged: (value) {
            setState(() {
              selectedPaymentMethod = value;
            });
          },
        ),
        PaymentOption(
          method: 'UPI',
          isSelected: selectedPaymentMethod == 'UPI',
          onChanged: (value) {
            setState(() {
              selectedPaymentMethod = value;
            });
          },
        ),
        PaymentOption(
          method: 'Wallet',
          isSelected: selectedPaymentMethod == 'Wallet',
          onChanged: (value) {
            setState(() {
              selectedPaymentMethod = value;
            });
          },
        ),
        PaymentOption(
          method: 'Credit / Debit Card',
          isSelected: selectedPaymentMethod == 'Credit / Debit Card',
          onChanged: (value) {
            setState(() {
              selectedPaymentMethod = value;
            });
          },
        ),
        const SizedBox(height: 16),
        // Add New Card
        Align(
          alignment: Alignment.centerRight,
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
      ],
    );
  }
}
