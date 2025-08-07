import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';

class AuthFooter extends StatelessWidget {
  final String question;
  final String actionText;
  final String route;

  const AuthFooter({
    super.key,
    required this.question,
    required this.actionText,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          text: question,
          style: AppFonts.montserrat(color: AppColors.textSecondary),
          children: [
            TextSpan(
              text: actionText,
              style: AppFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => context.go(route),
            ),
          ],
        ),
      ),
    );
  }
}
