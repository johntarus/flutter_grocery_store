import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/cart_item.dart';
import '../../../theme/app_colors.dart';
import 'quantity_selector.dart';

class CartItemWidget extends StatefulWidget {
  final CartItem item;
  final VoidCallback? onRemove;
  final Function(int)? onQuantityChanged;

  const CartItemWidget({
    super.key,
    required this.item,
    this.onRemove,
    this.onQuantityChanged,
  });

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  int quantity = 1;

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
              onPressed: widget.onRemove,
              color: AppColors.themeGreen,
            ),
          ),
          Positioned(
            right: 0,
            bottom: -20,
            child: QuantitySelector(
              quantity: quantity,
              canDecrease: quantity > 0,
              onDecrease: () {
                if (quantity > 0) {
                  setState(() {
                    quantity--;
                  });
                  widget.onQuantityChanged?.call(quantity);
                }
              },
              onIncrease: () {
                setState(() {
                  quantity++;
                });
                widget.onQuantityChanged?.call(quantity);
              },
            ),
          ),
        ],
      ),
    );
  }
}
