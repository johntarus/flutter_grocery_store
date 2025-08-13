import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sg_grocery/screens/cart/cart_screen.dart';
import 'package:sg_grocery/screens/profile/profile_screen.dart';

import '../components/custom_bottom_navigation_bar.dart';
import '../screens/explore/explore_screen.dart';
import '../screens/home/home_screen.dart';
import '../theme/app_colors.dart';

class MainLayout extends StatefulWidget {
  final int startIndex;
  final Widget? child;

  const MainLayout({super.key, this.startIndex = 0, this.child});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late int _currentIndex;

  final List<Widget> _pages = const [
    HomeScreen(),
    ExploreScreen(),
    CartScreen(),
    Center(child: Text("Favorites")),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.startIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child ?? _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == _currentIndex && widget.child != null) {
            context.go('/home?tab=$index');
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
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
