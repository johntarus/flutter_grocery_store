import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class PromoIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;

  const PromoIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: currentIndex == index ? 24 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: currentIndex == index
                ? AppColors.themeGreen
                : Colors.grey.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}
