import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_fonts.dart';
import 'components/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo
            Center(
              child: SvgPicture.asset(
                'assets/logo/auth_logo.svg',
                width: 221,
                height: 53,
              ),
            ),
            const SizedBox(height: 32),

            // Title
            Text(
              "Register",
              style: AppFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.themeGreen,
              ),
            ),
            const SizedBox(height: 26),
            const RegisterForm(),
          ],
        ),
      ),
    );
  }
}
