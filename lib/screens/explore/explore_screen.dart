import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sg_grocery/theme/app_colors.dart';

import '../../components/custom_header.dart';
import '../home/components/header_section.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 6,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) => Container(
          width: 120,
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
                  height: 69,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jaggery Powder',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.dimGreyColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '500 g',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.lightGreyColor,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '\$9.99',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: AppColors.themeGreen,
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/icons/add_icon.png',
                                width: 24,
                                height: 24,
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
      ),
    );
  }
}

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonHeader(
        title: 'Explore',
        backIconAsset: 'assets/icons/black_back.png',
        onBackPressed: () => Navigator.pop(context),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 20)),

          // Groceries Section
          SliverToBoxAdapter(
            child: SectionHeader(
              title: 'Groceries',
              actionText: 'See all',
              onActionPressed: () {
                context.push('/home/explore/category');
              },
            ),
          ),
          const SliverToBoxAdapter(child: ProductList()),

          const SliverToBoxAdapter(child: SizedBox(height: 26)),

          // Vegetables
          SliverToBoxAdapter(
            child: SectionHeader(title: 'Vegetables', actionText: 'See all'),
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

          // Bakery Section
          SliverToBoxAdapter(
            child: SectionHeader(title: 'Bakery Items', actionText: 'See all'),
          ),
          const SliverToBoxAdapter(child: ProductList()),

          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }
}
