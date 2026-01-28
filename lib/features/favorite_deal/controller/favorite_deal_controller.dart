import 'package:get/get.dart';
import 'package:the9thhour/features/search_deal/model/deal_model.dart';

class FavoriteDealController extends GetxController {
  final RxList<DealModel> favoriteProducts = <DealModel>[].obs;

  final RxString selectedSortOption = 'Lowest Price'.obs;
  final List<String> sortOptions = ['Lowest Price', 'Highest Price', 'Newest'];

  void changeSortOption(String value) {
    selectedSortOption.value = value;
  }

  void toggleFavoriteFromDeal(DealModel deal) {
    final existingIndex = favoriteProducts.indexWhere(
      (element) => element.title == deal.title,
    );

    if (existingIndex != -1) {
      favoriteProducts.removeAt(existingIndex);
      deal.isFavorite = false;
    } else {
      favoriteProducts.add(deal);
      deal.isFavorite = true;
    }
  }

  void removeFromFavorites(DealModel deal) {
    favoriteProducts.remove(deal);
    deal.isFavorite = false;
  }
}
