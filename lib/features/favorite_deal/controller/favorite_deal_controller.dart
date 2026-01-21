import 'package:get/get.dart';
import 'package:the9thhour/features/search_deal/model/deal_model.dart';

class FavoriteDealController extends GetxController {
  // DealModel এর লিস্ট ব্যবহার করা হচ্ছে
  final RxList<DealModel> favoriteProducts = <DealModel>[].obs;

  final RxString selectedSortOption = 'Lowest Price'.obs;
  final List<String> sortOptions = ['Lowest Price', 'Highest Price', 'Newest'];

  void changeSortOption(String value) {
    selectedSortOption.value = value;
    // এখানে সর্টিং লজিক বসাতে পারেন
  }

  // Search Screen থেকে ফেভারিট টগল করার ফাংশন
  void toggleFavoriteFromDeal(DealModel deal) {
    // চেক করি এই ডিলটি ইতিমধ্যে ফেভারিট লিস্টে আছে কিনা (টাইটেল দিয়ে চেক করা হচ্ছে)
    final existingIndex = favoriteProducts.indexWhere(
      (element) => element.title == deal.title,
    );

    if (existingIndex != -1) {
      // যদি থাকে, তাহলে রিমুভ করে দিই
      favoriteProducts.removeAt(existingIndex);
      deal.isFavorite = false;
    } else {
      // না থাকলে অ্যাড করি
      favoriteProducts.add(deal);
      deal.isFavorite = true;
    }
  }

  // ফেভারিট স্ক্রিন থেকে রিমুভ করার ফাংশন
  void removeFromFavorites(DealModel deal) {
    favoriteProducts.remove(deal);
    deal.isFavorite = false;
  }
}
