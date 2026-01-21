import 'package:get/get.dart';
import 'package:the9thhour/features/homepage/models/product_model.dart';
import 'package:the9thhour/features/search_deal/model/deal_model.dart';

class FavoriteDealController extends GetxController {
  final RxList<ProductModel> favoriteProducts = <ProductModel>[].obs;

  final RxString selectedSortOption = 'Popularity'.obs;
  final List<String> sortOptions = [
    'Popularity',
    'Price: Low to High',
    'Price: High to Low',
    'Newest',
  ];

  void changeSortOption(String value) {
    selectedSortOption.value = value;
  }

  void toggleFavorite(ProductModel product) {
    if (isFavorite(product)) {
      removeFromFavorites(product);
    } else {
      addToFavorites(product);
    }
  }

  void addToFavorites(ProductModel product) {
    if (!favoriteProducts.contains(product)) {
      favoriteProducts.add(product);
    }
  }

  void removeFromFavorites(ProductModel product) {
    favoriteProducts.removeWhere((item) => item.id == product.id);
    favoriteProducts.remove(product);
    favoriteProducts.removeWhere((item) => item.id == product.id);
    }

  bool isFavorite(ProductModel product) => favoriteProducts.contains(product);

  void toggleFavoriteFromDeal(DealModel deal) {
    final index = favoriteProducts.indexWhere((p) => p.name == deal.title);
    if (index != -1) {
      favoriteProducts.removeAt(index);
    } else {
      favoriteProducts.add(
        ProductModel(
          id: DateTime.now().toString(),
          imageUrl: deal.image,
          name: deal.title,
          brand: deal.brand,
          price: '\$${deal.price}',
          originalPrice: '\$${deal.oldPrice}',
          rating: deal.rating,
          reviews: deal.reviews,
        ),
      );
    }
  }
}
