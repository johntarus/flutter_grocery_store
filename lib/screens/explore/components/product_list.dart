import 'package:flutter/material.dart';

import 'product_card.dart';

class ProductList extends StatelessWidget {
  final List<ProductCardData> products;

  const ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) => ProductCard(
          imagePath: products[index].imagePath,
          name: products[index].name,
          weight: products[index].weight,
          price: products[index].price,
        ),
      ),
    );
  }
}

class ProductCardData {
  final String imagePath;
  final String name;
  final String weight;
  final String price;

  ProductCardData({
    required this.imagePath,
    required this.name,
    required this.weight,
    required this.price,
  });
}
