import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sg_grocery/screens/home/components/promo_card.dart';

import '../../../constants/data.dart';
import 'indicator_widget.dart';

class PromoSlider extends StatefulWidget {
  const PromoSlider({super.key});

  @override
  State<PromoSlider> createState() => _PromoSliderState();
}

class _PromoSliderState extends State<PromoSlider> {
  static const int _virtualItemCount = 10000; // large number to fake infinity
  late final PageController _pageController;
  Timer? _autoSlideTimer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    // Start from the middle to allow both forward/backward infinite scroll
    final int startPage = _virtualItemCount ~/ 2;
    _pageController = PageController(
      viewportFraction: 0.9,
      initialPage: startPage,
    );

    _currentPage = startPage;
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final int actualIndex = index % promoSliders.length;
                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    double scale = 1.0;
                    if (_pageController.position.haveDimensions) {
                      final pageOffset = _pageController.page! - index;
                      scale = (1 - pageOffset.abs()).clamp(0.85, 1.0);
                    }
                    return Transform.scale(scale: scale, child: child);
                  },
                  child: PromoCard(promo: promoSliders[actualIndex]),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          PromoIndicator(
            count: promoSliders.length,
            currentIndex: _currentPage % promoSliders.length,
          ),
        ],
      ),
    );
  }
}
