import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final Color backgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final Color indicatorColor;
  final List<BottomNavigationBarItem> items;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.backgroundColor = Colors.green,
    this.selectedItemColor = Colors.white,
    this.unselectedItemColor = Colors.white70,
    this.indicatorColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          top: BorderSide(color: indicatorColor.withOpacity(0.2), width: 0.5),
          bottom: BorderSide(color: indicatorColor, width: 2.0),
        ),
      ),
      child: SafeArea(
        child: SizedBox(
          height: 65,
          child: Stack(
            children: [
              // Navigation items
              Row(
                children: items.asMap().entries.map((entry) {
                  int index = entry.key;
                  BottomNavigationBarItem item = entry.value;
                  bool isSelected = currentIndex == index;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () => onTap(index),
                      child: Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              item.icon is Icon
                                  ? (item.icon as Icon).icon
                                  : Icons.home,
                              color: isSelected
                                  ? selectedItemColor
                                  : unselectedItemColor,
                              size: 24,
                            ),
                            if (item.label != null && item.label!.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  item.label!,
                                  style: TextStyle(
                                    color: isSelected
                                        ? selectedItemColor
                                        : unselectedItemColor,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              // Animated indicator line
              AnimatedPositioned(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                bottom: 8,
                left:
                    (MediaQuery.of(context).size.width / items.length) *
                        currentIndex +
                    (MediaQuery.of(context).size.width / items.length - 32) / 2,
                child: Container(
                  height: 3,
                  width: 32,
                  decoration: BoxDecoration(
                    color: indicatorColor,
                    borderRadius: BorderRadius.circular(1.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
