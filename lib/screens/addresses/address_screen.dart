import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sg_grocery/theme/app_colors.dart';

import '../../components/custom_header.dart';
import '../payment/components/address_option.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  String selectedDeliveryAddress = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeGreen,
      appBar: CommonHeader(
        title: 'My Addresses',
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
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        context.go('/home/profile/addresses/new_address');
                      },
                      child: Text(
                        '+ Add New Address',
                        style: GoogleFonts.montserrat(
                          color: AppColors.themeGreen,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: [
                        AddressOption(
                          title: 'Home',
                          address:
                              '4517 Washington Ave.\nManchester, Kentucky 39495',
                          icon: Icons.home_outlined,
                          isSelected: selectedDeliveryAddress == 'Home',
                          onSelected: (value) {
                            setState(() {
                              selectedDeliveryAddress = value;
                            });
                          },
                        ),
                        const Divider(height: 1),
                        AddressOption(
                          title: 'Office',
                          address:
                              '2118 Thornridge Cir. Syracuse,\nConnecticut 35624',
                          icon: Icons.business_outlined,
                          isSelected: selectedDeliveryAddress == 'Office',
                          onSelected: (value) {
                            setState(() {
                              selectedDeliveryAddress = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/home/profile/addresses/new_address');
        },
        backgroundColor: AppColors.themeGreen,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
