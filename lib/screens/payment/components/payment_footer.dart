import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentFooterSection extends StatelessWidget {
  final VoidCallback onPayPressed;
  final String paymentAmount;

  const PaymentFooterSection({
    super.key,
    required this.onPayPressed,
    required this.paymentAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        // Pay Button
        Center(
          child: ElevatedButton(
            onPressed: onPayPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4CAF50),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Text(
              'Pay $paymentAmount',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Privacy Policy
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFADADAD),
            ),
            children: [
              const TextSpan(
                text:
                    'Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our ',
              ),
              TextSpan(
                text: 'privacy policy',
                style: const TextStyle(
                  color: Color(0xFF4CAF50),
                  decoration: TextDecoration.underline,
                ),
              ),
              const TextSpan(text: '.'),
            ],
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
