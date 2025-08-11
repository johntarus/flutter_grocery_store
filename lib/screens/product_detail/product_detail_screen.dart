import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/custom_header.dart';
import '../../theme/app_colors.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final List<int> quantities = List.generate(1, (index) => 0);
  int index = 0;
  bool isSubscribed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: AppColors.themeGreen,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // CommonHeader replaces manual header
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: CommonHeader(
                      title: 'Details',
                      backgroundColor: Colors.transparent,
                      titleColor: Colors.white,
                      backIconAsset: 'assets/icons/white_back.png',
                      onBackPressed: () => Navigator.pop(context),
                      showBackButton: true,
                      titleAlignment: TextAlign.center,
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(40),
                      ),
                    ),
                  ),

                  // Apple image
                  Positioned(
                    bottom: -50,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Image.asset(
                        'assets/images/apple.png',
                        height: 229,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Product details
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
              child: _buildProductDetails(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Green Apple',
              style: GoogleFonts.montserrat(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.darkColor,
              ),
            ),
            const Spacer(),
            Row(
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
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      'assets/icons/larger_remove_cart_icon.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                SizedBox(
                  width: 32,
                  child: Text(
                    quantities[index].toString(),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
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
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      'assets/icons/larger_add_cart_icon.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Special price',
          style: GoogleFonts.montserrat(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: AppColors.themeGreen,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Text(
              '\$2',
              style: GoogleFonts.montserrat(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                color: AppColors.darkColor,
              ),
            ),
            const Spacer(),
            Text(
              '(42% off)',
              style: GoogleFonts.montserrat(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: AppColors.themeGreen,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Description',
          style: GoogleFonts.montserrat(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.darkColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Green apples have less sugar and carbs, and more fiber, protein, potassium, iron, and vitamin K, taking the lead as a healthier variety, although the differences are ever so slight.',
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.greyColor,
            height: 1.56,
          ),
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 120,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isSubscribed = !isSubscribed;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSubscribed
                      ? AppColors.themeGreen
                      : AppColors.greyBackgroundColor,
                  foregroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  minimumSize: const Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  elevation: 0,
                ),
                child: Text(
                  isSubscribed ? 'Subscribed' : 'Subscribe',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(width: 24),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.themeGreen),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                minimumSize: const Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'Buy Once',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: AppColors.themeGreen,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Text(
          'Related items',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              _buildRelatedItem('Pineapple'),
              const SizedBox(width: 16),
              _buildRelatedItem('Strawberry'),
              const SizedBox(width: 16),
              _buildRelatedItem('Grapes'),
            ],
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildRelatedItem(String name) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              name[0],
              style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
