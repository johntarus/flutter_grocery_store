import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_colors.dart';
import 'address_option.dart';

class AddressSelectionSection extends StatefulWidget {
  const AddressSelectionSection({super.key});

  @override
  State<AddressSelectionSection> createState() =>
      _AddressSelectionSectionState();
}

class _AddressSelectionSectionState extends State<AddressSelectionSection> {
  String selectedDeliveryAddress = 'Home';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        Column(
          children: [
            AddressOption(
              title: 'Home',
              address: '4517 Washington Ave.\nManchester, Kentucky 39495',
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
              address: '2118 Thornridge Cir. Syracuse,\nConnecticut 35624',
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
        const SizedBox(height: 16),
        // Add New Address Button
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              context.go('/home/profile/addresses');
            },

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
        ),
      ],
    );
  }
}
