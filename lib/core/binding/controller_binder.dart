import 'package:get/instance_manager.dart';
import 'package:the9thhour/features/favorite_deal/controller/favorite_deal_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<FavoriteDealController>(() => FavoriteDealController());
    
  }
}