import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../components/auth_footer.dart';
import '../../../components/social_buttons.dart';
import '../../../components/text_field.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_fonts.dart';
import '../../../utils/validators.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AuthTextField(
            label: "Email Id",
            hintText: "Enter Your Email Id",
            controller: _emailController,
            validator: Validators.validateEmail,
          ),
          const SizedBox(height: 18),
          AuthTextField(
            label: "Password",
            hintText: "Enter Your Password",
            obscureText: true,
            controller: _passwordController,
            validator: Validators.validatePassword,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                // if (_formKey.currentState!.validate()) {
                //TODO: Add login logic
                context.go('/home');
                // }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.themeGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Login",
                style: AppFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 26),
          Row(
            children: const [
              Expanded(
                child: Divider(color: AppColors.textSecondary, thickness: 1),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Or continue with",
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              ),
              Expanded(
                child: Divider(color: AppColors.textSecondary, thickness: 1),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const SocialButtons(),
          const SizedBox(height: 28),
          const AuthFooter(
            question: "Don't you have an account? ",
            actionText: "Register",
            route: '/signup',
          ),
        ],
      ),
    );
  }
}
