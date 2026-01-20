import 'package:get/get.dart';
import 'package:the9thhour/core/common/constants/iconpath.dart';
import 'package:the9thhour/core/common/constants/imagepath.dart';
import 'package:the9thhour/features/homepage/models/product_model.dart';

class HomePageController extends GetxController {
  RxInt selectedBrandIndex = 0.obs;
  RxString searchQuery = ''.obs;

  final List<ProductModel> products = [
    ProductModel(
      id: '1',
      name:
          'KAHI Wrinkle Bounce Multi Balm Stick | PDRN Collagen Wrinkle Stick',
      brand: 'From: Kahi Official',
      price: '\$22.99',
      originalPrice: '\$22.99',
      rating: 4.5,
      reviews: 120,
      imageUrl: ImagePath.product1,
    ),
    ProductModel(
      id: '2',
      name: 'Hyper Real Serumizer Eye Treatment',
      brand: 'From: MAC',
      price: '\$27.50',
      originalPrice: '\$55.99',
      rating: 4.5,
      reviews: 120,
      imageUrl: ImagePath.product2,
    ),
    ProductModel(
      id: '3',
      name: 'Toleriane Double Repair Face Moisturi...',
      brand: 'From: La Roche-Posay',
      price: '\$15.99',
      originalPrice: '\$20.99',
      rating: 4.5,
      reviews: 120,
      imageUrl: ImagePath.product2,
    ),
    ProductModel(
      id: '4',
      name: 'Ceramide Grinding Cleansing Balm',
      brand: 'From: Kojagi Beauty',
      price: '\$18.50',
      originalPrice: '\$25.99',
      rating: 4.5,
      reviews: 120,
      imageUrl: ImagePath.product2,
    ),
  ];

  final List<Map<String, dynamic>> brands = [
    {'label': ' All ', 'isText': true},
    {'label': 'amazon', 'isText': false, 'icon': IconPath.amazonIcon},
    {'label': 'Walmart', 'isText': false, 'icon': IconPath.walmartIcon},
    {'label': 'TARGET', 'isText': false, 'icon': IconPath.targetIcon},
    {'label': 'ULTA', 'isText': false, 'icon': IconPath.ultaIcon},
  ];

  void selectBrand(int index) {
    selectedBrandIndex.value = index;
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  void onViewDeal(int productIndex) {
    // TODO: Implement view deal logic
  }

  void onFavorite(int productIndex) {
    // TODO: Implement favorite logic
  }

  void onSeeMore() {
    // TODO: Navigate to deals page
  }
}
