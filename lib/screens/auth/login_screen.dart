import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/logo/auth_logo.svg',
                width: 221,
                height: 53,
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: SvgPicture.asset(
                'assets/illustrations/login_illustration.svg',
                height: 180,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              "Login",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF55AB60),
              ),
            ),
            const SizedBox(height: 26),
            const LoginForm(),
          ],
        ),
      ),
    );
  }
}
