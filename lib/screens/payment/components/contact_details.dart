import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_number_field.dart';
import 'custom_text_field.dart';

class ContactInformationSection extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final String selectedCountryCode;

  const ContactInformationSection({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.phoneController,
    required this.selectedCountryCode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Details',
          style: GoogleFonts.montserrat(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        // First Name
        CustomTextField(
          controller: firstNameController,
          hintText: 'First name',
        ),
        const SizedBox(height: 12),
        // Last Name
        CustomTextField(controller: lastNameController, hintText: 'Last name'),
        const SizedBox(height: 12),
        // Email
        CustomTextField(
          controller: emailController,
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 12),
        // Phone Number
        PhoneNumberField(
          controller: phoneController,
          countryCode: selectedCountryCode,
        ),
      ],
    );
  }
}
