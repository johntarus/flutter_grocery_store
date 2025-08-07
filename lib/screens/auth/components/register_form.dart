import 'package:flutter/material.dart';
import 'package:sg_grocery/utils/validators.dart';

import '../../../components/auth_footer.dart';
import '../../../components/social_buttons.dart';
import '../../../components/text_field.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_fonts.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AuthTextField(
            label: "Your Name",
            hintText: "Enter Your Name",
            controller: _nameController,
            validator: Validators.validateName,
          ),
          const SizedBox(height: 18),
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
            controller: _passwordController,
            obscureText: true,
            validator: Validators.validatePassword,
          ),
          const SizedBox(height: 18),
          AuthTextField(
            label: "Confirm Password",
            hintText: "Confirm Your Password",
            controller: _confirmPasswordController,
            obscureText: true,
            validator: (value) => Validators.validateConfirmPassword(
              _passwordController.text,
              value,
            ),
          ),
          const SizedBox(height: 18),
          AuthTextField(
            label: "Contact Number",
            hintText: "Enter Your Contact Number",
            controller: _contactController,
            validator: Validators.validateContact,
          ),
          const SizedBox(height: 26),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  //TODO: Add Registration logic here
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.themeGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Register",
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
            question: "Already Have an Account? ",
            actionText: "Login",
            route: '/login',
          ),
        ],
      ),
    );
  }
}
