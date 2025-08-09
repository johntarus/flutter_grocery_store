import 'package:flutter/material.dart';

import '../components/custom_bottom_navigation_bar.dart';
import '../screens/home/home_screen.dart';
import '../theme/app_colors.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    Center(child: Text("Categories")), // Replace with CategoriesScreen()
    Center(child: Text("Cart")), // Replace with CartScreen()
    Center(child: Text("Favorites")), // Replace with FavoritesScreen()
    Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
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
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home.png', width: 24, height: 24),
            activeIcon: Image.asset(
              'assets/icons/home.png',
              width: 24,
              height: 24,
            ),
            label: "",
          ),

          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/categories.png',
              width: 24,
              height: 24,
            ),
            activeIcon: Image.asset(
              'assets/icons/categories.png',
              width: 24,
              height: 24,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/cart.png', width: 24, height: 24),
            activeIcon: Image.asset(
              'assets/icons/cart.png',
              width: 24,
              height: 24,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/favorites.png',
              width: 24,
              height: 24,
            ),
            activeIcon: Image.asset(
              'assets/icons/favorites.png',
              width: 24,
              height: 24,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/profile.png',
              width: 24,
              height: 24,
            ),
            activeIcon: Image.asset(
              'assets/icons/profile.png',
              width: 24,
              height: 24,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
