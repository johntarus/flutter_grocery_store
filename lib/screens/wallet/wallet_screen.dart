import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/custom_header.dart';
import '../../theme/app_colors.dart';
import 'components/transaction_group.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeGreen,
      appBar: CommonHeader(
        title: 'Wallet',
        titleColor: AppColors.white,
        backgroundColor: AppColors.themeGreen,
        titleAlignment: TextAlign.start,
        bottomPadding: 22,
        backIconAsset: 'assets/icons/white_back.png',
        onBackPressed: () => Navigator.of(context).pop(),
        showBackButton: true,
      ),
      body: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        child: Container(
          color: Colors.white,
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                // Balance card
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.0999),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        "My Balance",
                        style: GoogleFonts.montserrat(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "\$20",
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: AppColors.themeGreen,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Use to pay 100% on any orders",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Color(0xFF989898),
                        ),
                      ),
                    ],
                  ),
                ),

                // Transactions list
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 16,
                    ),
                    children: [
                      buildTransactionGroup(
                        "17 Oct, 2021",
                        "Cashback Received",
                        "25917892598342",
                        2,
                        true,
                      ),
                      buildTransactionGroup(
                        "12 Oct, 2021",
                        "Spent On Order",
                        "23423423245342",
                        5,
                        false,
                      ),
                      buildTransactionGroup(
                        "05 Sept, 2021",
                        "Cashback Received",
                        "23289282638462",
                        3,
                        true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
