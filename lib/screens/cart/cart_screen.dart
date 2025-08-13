import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sg_grocery/screens/cart/components/discount_coupon.dart';

import '../../components/custom_header.dart';
import '../../constants/data.dart';
import '../../theme/app_colors.dart';
import 'components/cart_item_widget.dart';
import 'components/payment_detail_row.dart';

class CartItem {
  final String name;
  final String weight;
  final double originalPrice;
  final double discountedPrice;
  final String imageAsset;

  CartItem({
    required this.name,
    required this.weight,
    required this.originalPrice,
    required this.discountedPrice,
    required this.imageAsset,
  });
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculate total MRP
    double totalMRP = cartItems.fold(
      0,
      (sum, item) => sum + item.originalPrice,
    );

    return Scaffold(
      appBar: CommonHeader(
        title: 'My Cart',
        titleAlignment: TextAlign.center,
        // backIconAsset: 'assets/icons/black_back.png',
        titleColor: AppColors.darkColor,
        backgroundColor: AppColors.white,
        additionalHeight: 100,
        onBackPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Tomorrow, 7 AM - 9 PM',
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkColor,
                        ),
                      ),
                      Image.asset('assets/icons/arrow_down.png', height: 20),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Cart Items
              ...cartItems.map((item) => CartItemWidget(item: item)).toList(),
              const SizedBox(height: 40),
              // Discount Coupons
              DiscountCoupon(
                label: 'FLAT',
                discount: '50% OFF',
                subtitle: 'on your first order',
                footnote: 'Use coupon code to get OFFER',
                code: 'GETFIRST',
              ),
              const SizedBox(height: 16),
              DiscountCoupon(
                discount:
                    'GET 5'
                    '\$ OFF',
                subtitle: 'on minimum purchase of \$20',
                footnote: 'Applicable on Grocery only..',
                code: 'DOLLAR5',
                backgroundColor: Colors.red,
              ),
              const SizedBox(height: 8),

              const SizedBox(height: 12),
              Center(
                child: Text(
                  'Promo code can be applied on \npayment screen',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0x9974CA82),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Payment Details
              Text(
                'Payment details',
                style: GoogleFonts.montserrat(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkColor,
                ),
              ),
              const SizedBox(height: 8),
              PaymentDetailRow(label: 'Total MRP', value: '\$$totalMRP'),
              PaymentDetailRow(label: 'Discount', value: '\$0.00'),
              PaymentDetailRow(label: 'Shipping Charges', value: 'Free'),
              // const Divider(),
              PaymentDetailRow(
                label: 'Total',
                value: '\$$totalMRP',
                isTotal: true,
              ),
              const SizedBox(height: 30),
              // Checkout Button
              Center(
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.themeGreen,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Checkout',
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
