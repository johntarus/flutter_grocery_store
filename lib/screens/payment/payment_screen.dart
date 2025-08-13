import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/custom_header.dart';
import '../../theme/app_colors.dart';

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

  String selectedDeliveryAddress = 'Home';
  String selectedPaymentMethod = 'Credit / Debit Card';
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
                        // Contact Details Section
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
                        _buildTextField(
                          controller: _firstNameController,
                          hintText: 'First name',
                        ),
                        const SizedBox(height: 12),

                        // Last Name
                        _buildTextField(
                          controller: _lastNameController,
                          hintText: 'Last name',
                        ),
                        const SizedBox(height: 12),

                        // Email
                        _buildTextField(
                          controller: _emailController,
                          hintText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 12),

                        // Phone Number
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        color: const Color(0xFF1976D2),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          '🇺🇸',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    const Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _phoneController,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: 'Phone number',
                                    hintStyle: GoogleFonts.montserrat(
                                      color: Color(0xFF9B9B9B),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Delivery Address Section
                        Text(
                          'Choose Delivery Address',
                          style: GoogleFonts.montserrat(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkColor,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Address Options
                        Container(
                          child: Column(
                            children: [
                              _buildAddressOption(
                                'Home',
                                '4517 Washington Ave.\nManchester, Kentucky 39495',
                                Icons.home_outlined,
                                isSelected: selectedDeliveryAddress == 'Home',
                              ),
                              const Divider(height: 1),
                              _buildAddressOption(
                                'Office',
                                '2118 Thornridge Cir. Syracuse,\nConnecticut 35624',
                                Icons.business_outlined,
                                isSelected: selectedDeliveryAddress == 'Office',
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Add New Address Button
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              '+ Add New Address',
                              style: GoogleFonts.montserrat(
                                color: AppColors.themeGreen,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Promo Code Section
                        Text(
                          'Do you have a promo code / Coupon ?',
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkColor,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildTextField(
                              controller: _promoController,
                              hintText: 'Enter your code',
                              prefixIcon: Icons.local_offer_outlined,
                            ),
                            const SizedBox(height: 12),
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 16,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.themeGreen,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'Apply Now',
                                style: GoogleFonts.montserrat(
                                  color: AppColors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 32),

                        // Payment Method Section
                        Text(
                          'Choose payment method',
                          style: GoogleFonts.montserrat(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkColor,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Payment Options
                        _buildPaymentOption('Cash On Delivery'),
                        _buildPaymentOption('UPI'),
                        _buildPaymentOption('Wallet'),
                        _buildPaymentOption('Credit / Debit Card'),

                        const SizedBox(height: 16),

                        // Add New Card
                        Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.add_circle_outline,
                                color: Color(0xFF4CAF50),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Add New Card',
                                style: GoogleFonts.montserrat(
                                  color: AppColors.themeGreen,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Card Display
                        Row(
                          children: [
                            // Bank Card
                            Expanded(
                              child: Container(
                                height: 120,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF1A1A1A),
                                      Color(0xFF4A4A4A),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Standard Chartered',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Container(
                                          width: 20,
                                          height: 15,
                                          decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius: BorderRadius.circular(
                                              2,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    const Text(
                                      '1234 5678 9876 5432',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'MAX MUSTERMANN',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            // Visa Card
                            Expanded(
                              child: Container(
                                height: 120,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF9C27B0),
                                      Color(0xFF673AB7),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Visa Gold',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 4,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(
                                              0.3,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.contactless_outlined,
                                            color: Colors.white,
                                            size: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    const Text(
                                      '4000 1234 5678',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'J. JACKSON',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // CVV Input
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
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
                              child: _buildTextField(
                                controller: _cvvController,
                                hintText: 'e.g 123',
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 32),

                        // Pay Button
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4CAF50),
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 50,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Text(
                              'Pay \$9.97',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Privacy Policy
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFADADAD),
                            ),
                            children: [
                              TextSpan(
                                text:
                                    'Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our ',
                              ),
                              TextSpan(
                                text: 'privacy policy',
                                style: TextStyle(
                                  color: Color(0xFF4CAF50),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(text: '.'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    TextInputType? keyboardType,
    IconData? prefixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.montserrat(
            color: Color(0xFF9B9B9B),
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, color: Colors.grey)
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildAddressOption(
    String title,
    String address,
    IconData icon, {
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDeliveryAddress = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
        child: Row(
          children: [
            Radio<String>(
              value: title,
              groupValue: selectedDeliveryAddress,
              onChanged: (value) {
                setState(() {
                  selectedDeliveryAddress = value!;
                });
              },
              activeColor: AppColors.themeGreen,
            ),
            const SizedBox(width: 12),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(icon, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      address,
                      style: GoogleFonts.montserrat(
                        color: AppColors.darkColor,
                        height: 1.82,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Icon(Icons.edit_outlined, color: Colors.grey, size: 18),
                const SizedBox(width: 8),
                Icon(Icons.delete_outline, color: Colors.grey, size: 18),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String method) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: selectedPaymentMethod == method
            ? AppColors.themeGreenLight
            : Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: RadioListTile<String>(
        title: Text(
          method,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: selectedPaymentMethod == method
                ? AppColors.themeGreen
                : Color(0xFF7E7E7E),
          ),
        ),
        value: method,
        groupValue: selectedPaymentMethod,
        onChanged: (value) {
          setState(() {
            selectedPaymentMethod = value!;
          });
        },
        activeColor: const Color(0xFF4CAF50),
      ),
    );
  }
}
