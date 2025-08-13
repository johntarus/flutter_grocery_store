import 'package:flutter/material.dart';
import 'package:sg_grocery/theme/app_colors.dart';

import '../../components/custom_header.dart';
import 'components/category_section.dart';
import 'components/product_list.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final groceries = List.generate(
      6,
      (index) => ProductCardData(
        imagePath: 'assets/images/jaggery.png',
        name: 'Jaggery Powder',
        weight: '500 g',
        price: '\$9.99',
      ),
    );

    final vegetables = List.generate(
      6,
      (index) => ProductCardData(
        imagePath: 'assets/images/seasonal.png',
        name: 'Fresh Vegetable',
        weight: '1 kg',
        price: '\$4.99',
      ),
    );

    final fruits = List.generate(
      6,
      (index) => ProductCardData(
        imagePath: 'assets/images/fruit.png',
        name: 'Seasonal Fruit',
        weight: '1 kg',
        price: '\$5.99',
      ),
    );

    final dairy = List.generate(
      6,
      (index) => ProductCardData(
        imagePath: 'assets/images/gold_milk.png',
        name: 'Fresh Milk',
        weight: '1 L',
        price: '\$3.99',
      ),
    );

    final bakery = List.generate(
      6,
      (index) => ProductCardData(
        imagePath: 'assets/images/parle_rusk.png',
        name: 'Whole Wheat Bread',
        weight: '500 g',
        price: '\$2.99',
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonHeader(
        title: 'Explore',
        // backIconAsset: 'assets/icons/black_back.png',
        leftPadding: 16.0,
        titleAlignment: TextAlign.start,
        bottomPadding: 4.0,
        onBackPressed: () => Navigator.pop(context),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: CategorySection(title: 'Groceries', products: groceries),
          ),
          SliverToBoxAdapter(
            child: CategorySection(title: 'Vegetables', products: vegetables),
          ),
          SliverToBoxAdapter(
            child: CategorySection(title: 'Fruits', products: fruits),
          ),
          SliverToBoxAdapter(
            child: CategorySection(title: 'Dairy Products', products: dairy),
          ),
          SliverToBoxAdapter(
            child: CategorySection(title: 'Bakery Items', products: bakery),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }
}
