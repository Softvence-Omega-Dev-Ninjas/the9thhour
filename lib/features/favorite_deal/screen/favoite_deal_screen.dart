import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:the9thhour/core/common/style/global_text_style.dart';
import 'package:the9thhour/features/favorite_deal/controller/favorite_deal_controller.dart';
import 'package:the9thhour/features/favorite_deal/screen/favorite_deal_card.dart';
import 'package:the9thhour/features/search_deal/model/deal_model.dart';

class FavoriteDealScreen extends StatelessWidget {
  const FavoriteDealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteDealController());
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFFCFE9), Color(0xFFF5E6F0)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Color(0xFfFFCFE9),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 20.0,
              ),
            ),
          ),
          title: Text(
            'Favorite ',
            style: GlobalTextStyle.heading3.copyWith(fontSize: 22.sp),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Favorite ',
                            style: GlobalTextStyle.heading2.copyWith(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Deals',
                            style: GlobalTextStyle.heading1.copyWith(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      Text(
                        'Sort By: ',
                        style: GlobalTextStyle.heading2.copyWith(fontSize: 12),
                      ),
                      SizedBox(width: 5.w),
                      PopupMenuButton<String>(
                        onSelected: controller.changeSortOption,
                        itemBuilder: (BuildContext context) {
                          return controller.sortOptions.map((String choice) {
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Text(choice),
                            );
                          }).toList();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Obx(
                            () => Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  controller.selectedSortOption.value,
                                  style: GlobalTextStyle.bodyText.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const Icon(Icons.keyboard_arrow_down),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: Obx(() {
                  if (controller.favoriteProducts.isEmpty) {
                    return const Center(child: Text('No favorite deals yet!'));
                  } else {
                    return ListView.builder(
                      itemCount: controller.favoriteProducts.length,
                      itemBuilder: (context, index) {
                        final DealModel product =
                            controller.favoriteProducts[index];
                        return FavoriteDealCard(
                          product: product,
                          controller: controller,
                        );
                      },
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
