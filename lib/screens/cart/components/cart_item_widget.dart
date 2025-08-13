import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_colors.dart';

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
