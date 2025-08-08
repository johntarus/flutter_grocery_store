import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;
  Timer? _autoSlideTimer;

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

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_updatePage);
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < promoSliders.length - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _updatePage() {
    setState(() {
      _currentPage = _pageController.page?.round() ?? 0;
    });
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _pageController.removeListener(_updatePage);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF9FF),
      body: CustomScrollView(
        slivers: [
          // 🔍 Search Bar
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
          SliverToBoxAdapter(
            child: SizedBox(
              height: 170,
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: promoSliders.length,
                      onPageChanged: (index) {
                        setState(() => _currentPage = index);
                      },
                      itemBuilder: (context, index) {
                        final promo = promoSliders[index];
                        return AnimatedBuilder(
                          animation: _pageController,
                          builder: (context, child) {
                            double value = 1.0;
                            if (_pageController.position.haveDimensions) {
                              value = _pageController.page! - index;
                              value = (1 - value.abs()).clamp(0.7, 1.0);
                            }
                            return Transform.scale(scale: value, child: child);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                color: promo['color'],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          promo['title'],
                                          style: GoogleFonts.montserrat(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.white,
                                            height: 1.4,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          promo['discount'],
                                          style: GoogleFonts.montserrat(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Image.asset(
                                    promo['image'],
                                    height: 126,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(width: 16),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Page Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      promoSliders.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: _currentPage == index ? 24 : 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: _currentPage == index
                              ? AppColors.themeGreen
                              : Colors.grey.withOpacity(0.4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          // 🏷️ Top Categories Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    'Top Categories',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      color: AppColors.darkColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Explore all',
                    style: GoogleFonts.montserrat(
                      color: AppColors.themeGreen,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 150, // slightly increased to allow for floating image
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                itemCount: topCategories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 20),
                itemBuilder: (_, index) {
                  final category = topCategories[index];
                  return SizedBox(
                    width: 88,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topCenter,
                      children: [
                        // Main card body
                        Container(
                          margin: const EdgeInsets.only(top: 43),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              // Light green background section
                              Container(
                                height: 50,
                                decoration: const BoxDecoration(
                                  color: AppColors.themeGreenLight,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                              ),
                              // Green bottom label
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.themeGreen,
                                  borderRadius: const BorderRadius.vertical(
                                    bottom: Radius.circular(5),
                                  ),
                                ),
                                child: Text(
                                  category.name,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Floating image
                        Positioned(
                          top: 10,
                          child: Image.asset(
                            category.imagePath,
                            width: 75,
                            height: 70,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          // 🥑 Top Products
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Row(
                children: [
                  Text(
                    'Top Products',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      color: AppColors.darkColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Explore all',
                    style: GoogleFonts.montserrat(
                      color: AppColors.themeGreen,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 185, // Increased height to accommodate larger image
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 4,
                separatorBuilder: (_, __) => const SizedBox(width: 14),
                itemBuilder: (_, index) {
                  return Container(
                    width: 150,
                    decoration: BoxDecoration(
                      color: AppColors.themeGreenLight,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 18,
                            left: 18,
                            right: 18,
                            bottom: 12, // Reduced bottom padding
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            // Prevent column from expanding
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/images/fortune.png',
                                  fit: BoxFit.contain,
                                  height: 100,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Fortune rice',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '\$3/kg',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.darkColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 0,
                          child: Container(
                            padding: const EdgeInsets.only(
                              right: 20,
                              top: 4,
                              left: 6,
                              bottom: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.themeGreen,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Text(
                              '37%\noff',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 14,
                                height: 1.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          // 💰 Cashback
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.lightBlueColor,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Half donut shape - now sits flush
                    Positioned(
                      bottom: 0,
                      left: 23,
                      child: CustomPaint(
                        size: const Size(270, 125),
                        painter: _HalfDonutPainter(
                          outerColor: Colors.cyan.shade100,
                          innerColor: Colors.blue.shade50,
                        ),
                      ),
                    ),

                    // Left-aligned content with its own padding
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Get 25% Cashback',
                              style: GoogleFonts.montserrat(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: AppColors.jungleGreenColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'on all baby products',
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.jungleGreenColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Positioned Shop Now button
                    Positioned(
                      left: 28,
                      bottom: 24,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.themeGreen,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 4,
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Shop Now',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    // Bottom right image
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          'assets/images/cashback.png',
                          height: 130,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          // 🧃 Deals of the week
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Row(
                children: [
                  Text(
                    'Deals of the week',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      color: AppColors.darkColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Explore all',
                    style: GoogleFonts.montserrat(
                      color: AppColors.themeGreen,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 155,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (_, index) {
                  final item = categories[index];
                  return Container(
                    width: 130,
                    decoration: BoxDecoration(
                      color: AppColors.themeGreenLight,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(item["image"]!, height: 70),
                        const SizedBox(height: 8),
                        Text(
                          item["title"]!,
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkColor,
                          ),
                        ),
                        Text(
                          item["discount"]!,
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColors.themeGreen,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          // 🏷️ Featured Items
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Row(
                children: [
                  Text(
                    'Featured Items',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: AppColors.darkColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Explore all',
                    style: GoogleFonts.montserrat(
                      color: AppColors.themeGreen,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 155,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: featured.length,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (_, index) {
                  final item = featured[index];
                  return Container(
                    width: 130,
                    decoration: BoxDecoration(
                      color: item['bg_color'] ?? AppColors.themeGreenLight,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Centered image
                        Image.asset(item["image"]!, height: 70),
                        const SizedBox(height: 8),

                        // Left-aligned text section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item["title"]!,
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 1.44,
                                  color: AppColors.darkColor,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    "\$${item["price"]}",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.themeGreen,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    item["quantity"]!,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.darkColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 80)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.themeGreen,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}

// Dummy category model (replace with your actual model)
class Category {
  final String name;
  final String imagePath;

  Category({required this.name, required this.imagePath});
}

final List<Category> topCategories = [
  Category(name: 'Groceries', imagePath: 'assets/images/cooking_oil.png'),
  Category(name: 'Vegetables', imagePath: 'assets/images/tomato.png'),
  Category(name: 'Groceries', imagePath: 'assets/images/cooking_oil.png'),
  Category(name: 'Vegetables', imagePath: 'assets/images/tomato.png'),
  // Category(name: 'Fruits', imagePath: 'assets/images/fruits.png'),
  // Category(name: 'Beverages', imagePath: 'assets/images/beverages.png'),
];

class _HalfDonutPainter extends CustomPainter {
  final Color outerColor;
  final Color innerColor;

  _HalfDonutPainter({required this.outerColor, required this.innerColor});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 3, size.height);

    final outerRadius = size.width / 3;
    final innerRadius = outerRadius - 45; // thickness of the band

    final outerPaint = Paint()..color = outerColor;
    final innerPaint = Paint()..color = innerColor;

    // Draw outer semi-circle
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: outerRadius),
      math.pi, // start angle (180 degrees)
      math.pi, // sweep angle (180 degrees)
      true,
      outerPaint,
    );

    // Draw inner semi-circle to cut it out
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: innerRadius),
      math.pi,
      math.pi,
      true,
      innerPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

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
