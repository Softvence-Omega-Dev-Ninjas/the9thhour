import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:the9thhour/core/common/constants/iconpath.dart';
import 'package:the9thhour/core/common/style/global_text_style.dart';
import 'package:the9thhour/features/favorite_deal/controller/favorite_deal_controller.dart';
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
                  Row(
                    children: [
                      Text(
                        'Favorite Deals',
                        style: GlobalTextStyle.heading1.copyWith(
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
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
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      product.image,
                                      height: 100,
                                      width: 150,
                                    ),
                                    const SizedBox(width: 5),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              ...List.generate(5, (i) {
                                                if (i <
                                                    product.rating.floor()) {
                                                  return const Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                    size: 16,
                                                  );
                                                }
                                                if (i ==
                                                        product.rating
                                                            .floor() &&
                                                    product.rating.remainder(
                                                          1,
                                                        ) >=
                                                        0.5) {
                                                  return const Icon(
                                                    Icons.star_half,
                                                    color: Colors.amber,
                                                    size: 16,
                                                  );
                                                }
                                                return const Icon(
                                                  Icons.star_border,
                                                  color: Colors.amber,
                                                  size: 16,
                                                );
                                              }),
                                              const SizedBox(width: 4),
                                              Text(
                                                '${product.rating} (${product.reviews} Reviews)',
                                                style: GlobalTextStyle.bodyText
                                                    .copyWith(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            product.title,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GlobalTextStyle.bodyText.copyWith(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            'From: ${product.brand}',
                                            style: GlobalTextStyle.heading2
                                                .copyWith(fontSize: 12),
                                          ),
                                          const SizedBox(height: 6),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    '\$${product.price}',
                                                    style: GlobalTextStyle.bodyText
                                                        .copyWith(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  const SizedBox(width: 6),
                                                  Text(
                                                    '\$${product.oldPrice}',
                                                    style: const TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: const Color(
                                                    0xFF6B34AE,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          18.0,
                                                        ),
                                                  ),
                                                  minimumSize: const Size(
                                                    150,
                                                    30,
                                                  ),
                                                ),
                                                child: const Text(
                                                  'View Deal',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              InkWell(
                                                onTap: () {
                                                  controller
                                                      .removeFromFavorites(
                                                        product,
                                                      );
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets.all(
                                                    8,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: const Icon(
                                                    Icons.favorite,
                                                    color: Color(0XFF6B34AE),
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 5,
                                left: 5,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFf6B34AE),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Image.asset(
                                    IconPath.shareIcon,
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
