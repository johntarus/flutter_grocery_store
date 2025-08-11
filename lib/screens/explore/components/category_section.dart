import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../home/components/header_section.dart';
import 'product_list.dart';

class CategorySection extends StatelessWidget {
  final String title;
  final String routeName;
  final List<ProductCardData> products;

  const CategorySection({
    super.key,
    required this.title,
    required this.products,
    this.routeName = '/home/explore/category',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: title,
          actionText: 'See all',
          onActionPressed: () {
            context.push(routeName);
          },
        ),
        ProductList(products: products),
        const SizedBox(height: 26),
      ],
    );
  }
}
