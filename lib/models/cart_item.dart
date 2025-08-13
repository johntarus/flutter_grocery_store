class CartItem {
  final String name;
  final String weight;
  final double originalPrice;
  final double discountedPrice;
  final String imageAsset;

  CartItem({
    required this.name,
    required this.weight,
    required this.originalPrice,
    required this.discountedPrice,
    required this.imageAsset,
  });
}
