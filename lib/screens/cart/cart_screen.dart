import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../components/custom_header.dart';
import '../../models/cart_item.dart';
import '../../models/discount_coupon.dart';
import '../../theme/app_colors.dart';
import 'components/cart_item_widget.dart';
import 'components/cart_summary.dart';
import 'components/checkout_button.dart';
import 'components/delivery_time_selector.dart';
import 'components/promo_section.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> cartItems = [];

  @override
  void initState() {
    super.initState();
    _initializeCartItems();
  }

  void _initializeCartItems() {
    cartItems = [
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
  }

  void _removeCartItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  void _onQuantityChanged(int index, int quantity) {
    // Handle quantity changes if needed
    print('Item $index quantity changed to $quantity');
  }

  double get totalMRP =>
      cartItems.fold(0, (sum, item) => sum + item.originalPrice);

  double get totalDiscounted =>
      cartItems.fold(0, (sum, item) => sum + item.discountedPrice);

  @override
  Widget build(BuildContext context) {
    final coupons = [
      DiscountCouponData(
        label: 'FLAT',
        discount: '50% OFF',
        subtitle: 'on your first order',
        footnote: 'Use coupon code to get OFFER',
        code: 'GETFIRST',
      ),
      DiscountCouponData(
        discount: 'GET 5\$ OFF',
        subtitle: 'on minimum purchase of \$20',
        footnote: 'Applicable on Grocery only..',
        code: 'DOLLAR5',
        backgroundColor: Color(0xFFD6C533),
      ),
    ];

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
              // Delivery Time Section
              DeliveryTimeSelector(
                timeSlot: 'Tomorrow, 7 AM - 9 PM',
                onTap: () {
                  // Handle time slot selection
                },
              ),
              const SizedBox(height: 16),

              // Cart Items
              ...cartItems.asMap().entries.map((entry) {
                int index = entry.key;
                CartItem item = entry.value;
                return CartItemWidget(
                  item: item,
                  onRemove: () => _removeCartItem(index),
                  onQuantityChanged: (quantity) =>
                      _onQuantityChanged(index, quantity),
                );
              }).toList(),
              const SizedBox(height: 40),

              // Promo Section
              PromoSection(coupons: coupons),
              const SizedBox(height: 16),

              // Cart Summary
              CartSummary(totalMRP: totalMRP, discount: 0.00, total: totalMRP),
              const SizedBox(height: 30),

              // Checkout Button
              CheckoutButton(
                onPressed: () {
                  context.go('/home/cart/payment');
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
