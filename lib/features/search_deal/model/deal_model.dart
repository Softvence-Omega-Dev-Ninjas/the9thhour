class DealModel {
  final String title;
  final String brand;
  final String image;
  final double price;
  final double oldPrice;
  final double rating;
  final int reviews;
  bool isFavorite;

  DealModel({
    required this.title,
    required this.brand,
    required this.image,
    required this.price,
    required this.oldPrice,
    required this.rating,
    required this.reviews,
    this.isFavorite = false,
  });
}
