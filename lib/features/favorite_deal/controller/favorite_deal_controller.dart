import 'package:get/get.dart';
import 'package:the9thhour/features/homepage/models/product_model.dart';

class FavoriteDealController extends GetxController {
  final RxList<ProductModel> favoriteProducts = <ProductModel>[].obs;

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
  }

  bool isFavorite(ProductModel product) => favoriteProducts.contains(product);
}
