import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sg_grocery/screens/cart/components/discount_coupon.dart';

import '../../components/custom_header.dart';
import '../../theme/app_colors.dart';
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
    // Sample cart items
    final List<CartItem> cartItems = [
      CartItem(
        name: 'Shimla Apple',
        weight: '1 kg',
        originalPrice: 2.25,
        discountedPrice: 2.00,
        imageAsset: 'assets/images/pineapple.png',
      ),
      CartItem(
        name: 'Basmati Rice',
        weight: '1 kg',
        originalPrice: 8.00,
        discountedPrice: 4.00,
        imageAsset: 'assets/images/pineapple.png',
      ),
      CartItem(
        name: 'Organic Tomatoes',
        weight: '1 kg',
        originalPrice: 2.00,
        discountedPrice: 1.00,
        imageAsset: 'assets/images/tomato.png',
      ),
    ];

    // Calculate total MRP
    double totalMRP = cartItems.fold(
      0,
      (sum, item) => sum + item.originalPrice,
    );

    return Scaffold(
      appBar: CommonHeader(
        title: 'My Cart',
        titleAlignment: TextAlign.center,
        backIconAsset: 'assets/icons/black_back.png',
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
                backgroundColor: Color(0xFFD6C533),
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
                    onPressed: () {
                      context.go('/home/cart/payment');
                    },
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

// Cart Item Widget
class CartItemWidget extends StatefulWidget {
  final CartItem item;

  const CartItemWidget({super.key, required this.item});

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  final List<int> quantities = List.generate(1, (index) => 0);
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFFF9F9F9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Image.asset(
                    widget.item.imageAsset,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.name,
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppColors.darkColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.item.weight,
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF787878),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          '\$${widget.item.discountedPrice}',
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.darkColor,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Text(
                          '\$${widget.item.originalPrice}',
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                            color: Color(0xFFB4B4B4),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: Image.asset(
                'assets/icons/close.png',
                width: 24,
                height: 24,
              ),
              onPressed: () {},
              color: AppColors.themeGreen,
            ),
          ),
          Positioned(
            right: 0,
            bottom: -20,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: quantities[index] > 0
                      ? () {
                          setState(() {
                            quantities[index]--;
                          });
                        }
                      : null,
                  child: SizedBox(
                    height: 30,
                    child: Image.asset(
                      'assets/icons/larger_remove_cart_icon.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                SizedBox(
                  width: 20,
                  child: Text(
                    quantities[index].toString(),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: AppColors.themeGreen,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      quantities[index]++;
                    });
                  },
                  child: SizedBox(
                    height: 30,
                    child: Image.asset(
                      'assets/icons/larger_add_cart_icon.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
