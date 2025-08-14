import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sg_grocery/theme/app_colors.dart';

import '../../components/custom_header.dart';
import 'components/order_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonHeader(
        title: 'Orders',
        backgroundColor: AppColors.themeGreen,
        titleColor: AppColors.white,
        backIconAsset: 'assets/icons/white_back.png',
        titleAlignment: TextAlign.start,
        leftPadding: 16,
      ),
      backgroundColor: const Color(0xFF6BB26C),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title Section
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Text(
                        'Order History',
                        style: GoogleFonts.montserrat(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkColor,
                        ),
                      ),
                    ),

                    // Orders List
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          children: const [
                            OrderItem(
                              productImage:
                                  'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=100&h=100&fit=crop',
                              status: 'Arrives Tomorrow',
                              timeSlot: '7 AM - PM',
                              showTrackOrder: true,
                              showEditOrder: true,
                              isFirst: true,
                            ),
                            OrderItem(
                              productImage:
                                  'https://images.unsplash.com/photo-1622206151226-18ca2c9ab4a1?w=100&h=100&fit=crop',
                              status: 'Delivered on 23 oct',
                              timeSlot: '',
                              showTrackOrder: false,
                              showEditOrder: false,
                            ),
                            OrderItem(
                              productImage:
                                  'https://images.unsplash.com/photo-1613478223719-2ab802602423?w=100&h=100&fit=crop',
                              status: 'Delivered on 15 oct',
                              timeSlot: '',
                              showTrackOrder: false,
                              showEditOrder: false,
                              isLast: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
