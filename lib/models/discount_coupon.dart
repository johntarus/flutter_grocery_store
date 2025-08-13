import 'dart:ui';

class DiscountCouponData {
  final String? label;
  final String discount;
  final String subtitle;
  final String footnote;
  final String code;
  final Color? backgroundColor;

  DiscountCouponData({
    this.label,
    required this.discount,
    required this.subtitle,
    required this.footnote,
    required this.code,
    this.backgroundColor,
  });
}
