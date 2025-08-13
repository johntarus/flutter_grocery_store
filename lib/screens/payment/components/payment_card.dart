import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'credit_card.dart';
import 'custom_text_field.dart';

class CardDisplaySection extends StatelessWidget {
  final TextEditingController cvvController;

  const CardDisplaySection({super.key, required this.cvvController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        // Card Display
        Row(
          children: [
            // Bank Card
            Expanded(
              child: CreditCard(
                bankName: 'Standard Chartered',
                cardNumber: '1234 5678 9876 5432',
                cardHolder: 'MAX MUSTERMANN',
                gradientColors: const [Color(0xFF1A1A1A), Color(0xFF4A4A4A)],
                chipColor: Colors.amber,
              ),
            ),
            const SizedBox(width: 12),
            // Visa Card
            Expanded(
              child: CreditCard(
                bankName: 'Visa Gold',
                cardNumber: '4000 1234 5678',
                cardHolder: 'J. JACKSON',
                gradientColors: const [Color(0xFF9C27B0), Color(0xFF673AB7)],
                hasContactless: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // CVV Input
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF4CAF50),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Enter CVV',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomTextField(
                controller: cvvController,
                hintText: 'e.g 123',
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
