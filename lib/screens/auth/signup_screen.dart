import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: const Color(0xFF55AB60),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Create an Account',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: const Color(0xFF55AB60),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Add your sign-up form fields here
            // For example, TextFormField for email, password, etc.
          ],
        ),
      ),
    );
  }
}
