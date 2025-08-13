import 'package:flutter/material.dart';

import '../models/cart_item.dart';
import '../models/category.dart';
import '../theme/app_colors.dart';

// Promo sliders data
final List<Map<String, dynamic>> promoSliders = [
  {
    'title': 'Everyday\nEssentials',
    'discount': '10% off',
    'color': AppColors.themeGreen,
    'image': 'assets/images/essentials.png',
  },
  {
    'title': 'Weekly\nSpecials',
    'discount': '15% off',
    'color': Colors.red,
    'image': 'assets/images/specials.png',
  },
  {
    'title': 'Seasonal\nOffers',
    'discount': '20% off',
    'color': Colors.orange,
    'image': 'assets/images/seasonal.png',
  },
];

// Top categories data
final List<Category> topCategories = [
  Category(name: 'Groceries', imagePath: 'assets/images/cooking_oil.png'),
  Category(name: 'Vegetables', imagePath: 'assets/images/tomato.png'),
  Category(name: 'Fruits', imagePath: 'assets/images/fruit.png'),
  Category(name: 'Beverages', imagePath: 'assets/images/beverage.png'),
];

// Top products data
final List<Map<String, String>> topProducts = [
  {
    "title": "Fortune rice",
    "price": "5/Kg",
    "image": "assets/images/fortune.png",
  },
  {
    "title": "Fresh Avocado",
    "price": "7/Kg",
    "image": "assets/images/avocado.png",
  },
  {"title": "Tomato", "price": "2/Kg", "image": "assets/images/tomato.png"},
];

// Deals of the week data
final List<Map<String, String>> categories = [
  {
    "title": "Soft drinks",
    "discount": "Upto 40% off",
    "image": "assets/images/soft_drink.png",
  },
  {
    "title": "Tea",
    "discount": "Flat 30% off",
    "image": "assets/images/tea.png",
  },
  {
    "title": "Bath Oil",
    "discount": "Min 20% off",
    "image": "assets/images/bath_oil.png",
  },
];

// Featured items data
final List<Map<String, dynamic>> featured = [
  {
    "title": "Granola\nPremium Almond",
    "price": "22.00",
    "quantity": "1 Kg",
    "image": "assets/images/almond.png",
    "bg_color": AppColors.lightPinkColor,
  },
  {
    "title": "SFT kiwi slice\n(Dried)",
    "price": "4.00",
    "quantity": "3 pcs.",
    "image": "assets/images/kiwi.png",
    "bg_color": AppColors.lightYellowColor,
  },
  {
    "title": "SFT kiwi slice\n(Dried)",
    "price": "5.00",
    "quantity": "3 pcs.",
    "image": "assets/images/spaghetti.png",
    "bg_color": AppColors.lightCreamColor,
  },
];

// Groceries data
final List<Map<String, dynamic>> groceries = [
  {
    "title": "Granola\nPremium Almond",
    "price": "22.00",
    "quantity": "1 Kg",
    "image": "assets/images/almond.png",
    "bg_color": AppColors.lightPinkColor,
  },
  {
    "title": "SFT kiwi slice\n(Dried)",
    "price": "4.00",
    "quantity": "3 pcs.",
    "image": "assets/images/kiwi.png",
    "bg_color": AppColors.lightYellowColor,
  },
  {
    "title": "SFT kiwi slice\n(Dried)",
    "price": "5.00",
    "quantity": "3 pcs.",
    "image": "assets/images/spaghetti.png",
    "bg_color": AppColors.lightCreamColor,
  },
];

// Sample cart items
final List<CartItem> cartItems = [
  CartItem(
    name: 'Shimla Apple',
    weight: '1 kg',
    originalPrice: 2.25,
    discountedPrice: 2.00,
    imageAsset: 'assets/images/pineapple.png',
  ),
  CartItem(
    name: 'Basmati Rice',
    weight: '1 kg',
    originalPrice: 8.00,
    discountedPrice: 4.00,
    imageAsset: 'assets/images/pineapple.png',
  ),
  CartItem(
    name: 'Organic Tomatoes',
    weight: '1 kg',
    originalPrice: 2.00,
    discountedPrice: 1.00,
    imageAsset: 'assets/images/tomato.png',
  ),
];
