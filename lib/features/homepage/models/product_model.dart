class ProductModel {
  final String id;
  final String name;
  final String brand;
  final String price;
  final String originalPrice;
  final double rating;
  final int reviews;
  final String imageUrl;

  ProductModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.originalPrice,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'price': price,
      'originalPrice': originalPrice,
      'rating': rating,
      'reviews': reviews,
      'imageUrl': imageUrl,
    };
  }

  // Create from JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      brand: json['brand'] as String,
      price: json['price'] as String,
      originalPrice: json['originalPrice'] as String,
      rating: json['rating'] as double,
      reviews: json['reviews'] as int,
      imageUrl: json['imageUrl'] as String,
    );
  }
}
