import 'package:flutter/material.dart';

import '../../components/custom_header.dart';
import '../../theme/app_colors.dart';
import 'components/address.dart';
import 'components/contact_details.dart';
import 'components/payment_card.dart';
import 'components/payment_footer.dart';
import 'components/payment_method.dart';
import 'components/promo_code.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _promoController = TextEditingController();
  final _cvvController = TextEditingController();

  String selectedCountryCode = 'US';

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _promoController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeGreen,
      appBar: CommonHeader(
        title: 'Payment',
        titleColor: AppColors.white,
        backIconAsset: 'assets/icons/white_back.png',
        backgroundColor: AppColors.themeGreen,
        titleAlignment: TextAlign.start,
        bottomPadding: 16.0,
        onBackPressed: () => Navigator.pop(context),
      ),
      body: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        child: Column(
          children: [
            // Main Content
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Contact Information
                        ContactInformationSection(
                          firstNameController: _firstNameController,
                          lastNameController: _lastNameController,
                          emailController: _emailController,
                          phoneController: _phoneController,
                          selectedCountryCode: selectedCountryCode,
                        ),
                        const SizedBox(height: 32),
                        // Delivery Address
                        const AddressSelectionSection(),
                        const SizedBox(height: 24),
                        // Promo Code
                        PromoCodeSection(promoController: _promoController),
                        const SizedBox(height: 32),
                        // Payment Method
                        const PaymentMethodSection(),
                        // Card Display and CVV
                        CardDisplaySection(cvvController: _cvvController),
                        // Footer with Pay Button
                        PaymentFooterSection(
                          onPayPressed: () {
                            // Handle payment logic
                          },
                          paymentAmount: '\$9.97',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
