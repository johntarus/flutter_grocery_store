import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sg_grocery/theme/app_colors.dart';

class OrderItem extends StatelessWidget {
  final String productImage;
  final String status;
  final String timeSlot;
  final bool showTrackOrder;
  final bool showEditOrder;
  final bool isFirst;
  final bool isLast;

  const OrderItem({
    super.key,
    required this.productImage,
    required this.status,
    required this.timeSlot,
    required this.showTrackOrder,
    required this.showEditOrder,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTimeline(),
          const SizedBox(width: 16),
          Expanded(child: _buildContent(context)),
        ],
      ),
    );
  }

  Widget _buildTimeline() {
    return Column(
      children: [
        if (!isFirst)
          Container(width: 2, height: 40, color: const Color(0xFF6BB26C)),
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFF6BB26C), width: 3),
            shape: BoxShape.circle,
          ),
        ),
        if (!isLast)
          Expanded(child: Container(width: 2, color: const Color(0xFF6BB26C))),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProductAndStatus(),
          const SizedBox(height: 20),
          _buildActionButtons(),
          if (showEditOrder || !showTrackOrder) ...[
            const SizedBox(height: 12),
            _buildSecondaryButtons(),
          ],
        ],
      ),
    );
  }

  Widget _buildProductAndStatus() {
    return Row(
      children: [
        _buildProductImages(),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                status,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkColor,
                ),
              ),
              if (timeSlot.isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(
                  timeSlot,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProductImages() {
    return Row(
      children: [
        _productImage(productImage),
        const SizedBox(width: 8),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!, width: 1),
          ),
          child: const Center(
            child: Text(
              '+1',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _productImage(String url) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          url,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.image, color: Colors.grey, size: 30),
            );
          },
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: AppColors.themeGreen, width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: Text(
              'View order details',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.themeGreen,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: showTrackOrder
              ? ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6BB26C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    elevation: 0,
                  ),
                  child: Text(
                    'Track Order',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                )
              : TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Get Invoice',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.themeGreen,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildSecondaryButtons() {
    return Row(
      children: [
        if (showEditOrder)
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 8),
            ),
            child: Text(
              'Edit Order',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.themeGreen,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        const Spacer(),
        if (showEditOrder)
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 8),
            ),
            child: Text(
              'Get Invoice',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.themeGreen,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
      ],
    );
  }
}
