import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the9thhour/core/common/constants/iconpath.dart';
import '../model/deal_model.dart';

class SearchDealController extends GetxController {
  late final TextEditingController searchController;
  RxInt selectedBrandIndex = 0.obs;
  RxString selectedSortOption = 'Lowest Price'.obs;

  final List<String> sortOptions = ['Lowest Price', 'Highest Price', 'Newest'];

  final List<Map<String, dynamic>> brands = [
    {'label': ' All ', 'isText': true},
    {'label': 'amazon', 'isText': false, 'icon': IconPath.amazonIcon},
    {'label': 'Walmart', 'isText': false, 'icon': IconPath.walmartIcon},
    {'label': 'TARGET', 'isText': false, 'icon': IconPath.targetIcon},
    {'label': 'ULTA', 'isText': false, 'icon': IconPath.ultaIcon},
  ];

  final deals = <DealModel>[
    DealModel(
      title: 'THE CRÈME - Advanced Hydration Gradual Self...',
      brand: 'TAN-LUXE',
      image: 'assets/images/product1.png',
      price: 12.25,
      oldPrice: 28.00,
      rating: 4.5,
      reviews: 120,
    ),
    DealModel(
      title: 'Ceramide Grinding Cleansing Balm',
      brand: 'Kora Beauty',
      image: 'assets/images/product2.png',
      price: 18.00,
      oldPrice: 36.99,
      rating: 4.5,
      reviews: 120,
    ),
    DealModel(
      title: 'New Product Title',
      brand: 'New Brand',
      image: 'assets/images/product1.png',
      price: 25.00,
      oldPrice: 50.00,
      rating: 4.0,
      reviews: 90,
    ),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
  }

  void selectBrand(int index) {
    selectedBrandIndex.value = index;
  }

  void changeSortOption(String? option) {
    if (option != null) {
      selectedSortOption.value = option;
      // TODO: Implement actual sorting logic for deals
    }
  }

  void toggleFavorite(DealModel deal) {
    final index = deals.indexOf(deal);
    if (index != -1) {
      deals[index].isFavorite = !deals[index].isFavorite;
      deals.refresh();
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
