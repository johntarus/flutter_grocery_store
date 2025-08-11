import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sg_grocery/components/custom_header.dart';
import 'package:sg_grocery/theme/app_colors.dart';

import '../home/components/header_section.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeGreen,
      appBar: CommonHeader(
        title: 'Categories',
        titleAlignment: TextAlign.start,
        backIconAsset: 'assets/icons/white_back.png',
        titleColor: AppColors.white,
        backgroundColor: AppColors.themeGreen,
        onBackPressed: () => Navigator.pop(context),
      ),
      body: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        child: Container(
          color: Colors.white,
          child: SafeArea(
            top: false, // let content go under appbar curve
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: SizedBox(height: 20)),

                const SliverToBoxAdapter(child: ProductList()),
                const SliverToBoxAdapter(child: SizedBox(height: 26)),

                // Vegetables
                SliverToBoxAdapter(
                  child: SectionHeader(
                    title: 'Vegetables',
                    actionText: 'See all',
                  ),
                ),
                const SliverToBoxAdapter(child: ProductList()),
                const SliverToBoxAdapter(child: SizedBox(height: 26)),

                // Fruits
                SliverToBoxAdapter(
                  child: SectionHeader(title: 'Fruits', actionText: 'See all'),
                ),
                const SliverToBoxAdapter(child: ProductList()),
                const SliverToBoxAdapter(child: SizedBox(height: 26)),

                // Dairy Products
                SliverToBoxAdapter(
                  child: SectionHeader(
                    title: 'Dairy Products',
                    actionText: 'See all',
                  ),
                ),
                const SliverToBoxAdapter(child: ProductList()),
                const SliverToBoxAdapter(child: SizedBox(height: 26)),

                // Bakery Items
                SliverToBoxAdapter(
                  child: SectionHeader(
                    title: 'Bakery Items',
                    actionText: 'See all',
                  ),
                ),
                const SliverToBoxAdapter(child: ProductList()),
                const SliverToBoxAdapter(child: SizedBox(height: 40)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<int> quantities = List.generate(6, (index) => 0);
  bool isSubscribed = false;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 236,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 6,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) => Stack(
          children: [
            // Product Card
            Container(
              width: 190,
              decoration: BoxDecoration(
                color: AppColors.themeGreenLight,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/jaggery.png',
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Strawberry ',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.dimGreyColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '(1kg)',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.lightGreyColor,
                                    ),
                                  ),
                                ],
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$2.00',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.themeGreen,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: quantities[index] > 0
                                          ? () {
                                              setState(() {
                                                quantities[index]--;
                                              });
                                            }
                                          : null,
                                      child: Image.asset(
                                        'assets/icons/remove_cart.png',
                                        height: 18,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    SizedBox(
                                      width: 20,
                                      child: Text(
                                        quantities[index].toString(),
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14,
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
                                      child: Image.asset(
                                        'assets/icons/add_cart.png',
                                        height: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                SizedBox(
                                  width: 90,
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
                                        horizontal: 6,
                                        vertical: 4,
                                      ),
                                      minimumSize: const Size(0, 0),
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      elevation: 0,
                                    ),
                                    child: Text(
                                      isSubscribed ? 'Subscribed' : 'Subscribe',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 4,
                                    ),
                                    side: const BorderSide(
                                      color: AppColors.themeGreen,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    minimumSize: const Size(0, 0),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: Text(
                                    'Buy Once',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      color: AppColors.themeGreen,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Top-right icon
            Positioned(
              top: 6,
              right: 6,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite
                      ? const Color(0xFFEC5353)
                      : Color(0xFFFF3F3F),
                  size: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
