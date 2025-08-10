import 'package:flutter/material.dart';
import 'package:sg_grocery/components/custom_header.dart';
import 'package:sg_grocery/theme/app_colors.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonHeader(
        title: 'Categories',
        titleAlignment: TextAlign.start,
        backIconAsset: 'assets/icons/white_back.png',
        titleColor: AppColors.white,
        backgroundColor: AppColors.themeGreen,
        onBackPressed: () => Navigator.pop(context),
      ),
      body: Center(
        child: Text(
          'Category Screen',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
