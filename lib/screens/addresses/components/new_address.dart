import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sg_grocery/theme/app_colors.dart';

import '../../../components/custom_header.dart';

class NewAddress extends StatefulWidget {
  const NewAddress({super.key});

  @override
  State<NewAddress> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<NewAddress> {
  final _formKey = GlobalKey<FormState>();
  String? _addressType;
  final Map<String, TextEditingController> _controllers = {
    'country': TextEditingController(),
    'state': TextEditingController(),
    'city': TextEditingController(),
    'pincode': TextEditingController(),
    'area': TextEditingController(),
    'landmark': TextEditingController(),
  };

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeGreen,
      appBar: CommonHeader(
        title: 'Add New Address',
        titleColor: AppColors.white,
        backgroundColor: AppColors.themeGreen,
        titleAlignment: TextAlign.start,
        bottomPadding: 22,
        backIconAsset: 'assets/icons/white_back.png',
        onBackPressed: () => Navigator.of(context).pop(),
        showBackButton: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(40),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextField('Country', 'country'),
                        const SizedBox(height: 20),
                        _buildTextField('State', 'state'),
                        const SizedBox(height: 20),
                        _buildTextField('City', 'city'),
                        const SizedBox(height: 20),
                        _buildTextField(
                          'Pincode',
                          'pincode',
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 20),
                        _buildTextField('Area', 'area'),
                        const SizedBox(height: 20),
                        _buildTextField(
                          'Landmark (optional)',
                          'landmark',
                          isRequired: false,
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'Address Type',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkColor,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            _buildAddressTypeChip('Home'),
                            const SizedBox(width: 12),
                            _buildAddressTypeChip('Work/Office'),
                            const SizedBox(width: 12),
                            _buildAddressTypeChip('Other'),
                          ],
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _saveAddress,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.themeGreen,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Save',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    String label,
    String key, {
    bool isRequired = true,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: _controllers[key],
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.montserrat(color: AppColors.greyColor),
        filled: true,
        fillColor: Colors.grey[200],
        // grey background
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.themeGreen, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      keyboardType: keyboardType,
      validator: isRequired
          ? (value) => value?.isEmpty ?? true ? 'This field is required' : null
          : null,
    );
  }

  Widget _buildAddressTypeChip(String type) {
    return ChoiceChip(
      label: Text(type),
      selected: _addressType == type,
      onSelected: (selected) {
        setState(() => _addressType = selected ? type : null);
      },
      selectedColor: AppColors.themeGreen.withOpacity(0.2),
      labelStyle: GoogleFonts.montserrat(
        color: _addressType == type ? AppColors.themeGreen : Colors.black87,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: _addressType == type
              ? AppColors.themeGreen
              : Colors.grey[300]!,
        ),
      ),
    );
  }

  void _saveAddress() {
    if (_formKey.currentState!.validate() && _addressType != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Address saved successfully')),
      );
      Future.delayed(const Duration(milliseconds: 500), () {
        context.pop();
      });
    } else if (_addressType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an address type')),
      );
    }
  }
}
