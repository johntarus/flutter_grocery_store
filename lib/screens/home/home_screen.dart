import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/custom_bottom_navigation_bar.dart';
import '../../constants/data.dart';
import '../../theme/app_colors.dart';
import 'components/cashback_banner.dart';
import 'components/deals_of_the_week.dart';
import 'components/featured_items.dart';
import 'components/header_section.dart';
import 'components/product_card.dart';
import 'components/promo_slider.dart';
import 'components/top_categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF9FF),
      body: CustomScrollView(
        slivers: [
          // Search Bar
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 50, 16, 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search products and brands',
                  hintStyle: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyColor,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.greyColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
          ),

          // Promo Slider
          SliverToBoxAdapter(child: const PromoSlider()),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          // Top Categories
          SliverToBoxAdapter(
            child: SectionHeader(
              title: 'Top Categories',
              actionText: 'Explore all',
            ),
          ),
          SliverToBoxAdapter(child: const TopCategories()),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          // Top Products
          SliverToBoxAdapter(
            child: SectionHeader(
              title: 'Top Products',
              actionText: 'Explore all',
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 185,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: topProducts.length,
                separatorBuilder: (_, __) => const SizedBox(width: 14),
                itemBuilder: (_, index) {
                  final item = topProducts[index];
                  return ProductCard(
                    image: item['image']!,
                    title: item['title']!,
                    price: item['price']!,
                    discount: '37%\noff',
                  );
                },
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          // Cashback Banner
          SliverToBoxAdapter(child: const CashbackBanner()),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          // Deals of the Week
          SliverToBoxAdapter(child: const DealsOfTheWeek()),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          // Featured Items
          SliverToBoxAdapter(child: const FeaturedItems()),
          const SliverToBoxAdapter(child: SizedBox(height: 80)),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: AppColors.themeGreen,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.white.withOpacity(0.7),
        indicatorColor: AppColors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            activeIcon: Icon(Icons.category),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            activeIcon: Icon(Icons.favorite),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: "",
          ),
        ],
      ),
    );
  }
}
