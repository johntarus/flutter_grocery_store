import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyText extends StatelessWidget {
  final VoidCallback onPolicyTap;

  const PrivacyPolicyText({super.key, required this.onPolicyTap});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: const Color(0xFFADADAD),
        ),
        children: [
          const TextSpan(
            text:
                'Your personal data will be used to process your order, support your experience, and for other purposes described in our ',
          ),
          TextSpan(
            text: 'privacy policy',
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = onPolicyTap,
          ),
        ],
      ),
    );
  }
}
