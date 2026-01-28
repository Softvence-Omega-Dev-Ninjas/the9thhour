import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:the9thhour/core/common/constants/iconpath.dart';
import 'package:the9thhour/core/common/style/global_text_style.dart';
import 'package:the9thhour/features/favorite_deal/controller/favorite_deal_controller.dart';
import 'package:the9thhour/features/search_deal/controller/search_deal_controller.dart';
import 'package:the9thhour/features/search_deal/model/deal_model.dart';
import 'package:the9thhour/features/search_deal/widgets/share_bottom_sheet.dart';

class DealCardWidget extends StatelessWidget {
  final DealModel deal;
  const DealCardWidget({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchDealController>();
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: -145,
            right: 30,
            bottom: 0,
            child: Transform.rotate(
              angle: -3.1415926535 / 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  'assets/images/cardBackground.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Image.asset(deal.image, height: 100, width: 150),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ...List.generate(5, (i) {
                            if (i < deal.rating.floor()) {
                              return const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              );
                            }
                            if (i == deal.rating.floor() &&
                                deal.rating.remainder(1) >= 0.5) {
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
                            '${deal.rating} (${deal.reviews} Reviews)',
                            style: GlobalTextStyle.bodyText.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        deal.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GlobalTextStyle.bodyText.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'From: ${deal.brand}',
                        style: GlobalTextStyle.bodyText.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "\$${deal.price}",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w800,
                                  color: const Color(0xFFA30293),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                '\$${deal.oldPrice}',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
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
                            onPressed: () => _showLoginBottomSheet(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF6B34AE),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              minimumSize: const Size(150, 30),
                            ),
                            child: Text(
                              'View Deal',
                              style: GlobalTextStyle.bodyText.copyWith(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: () {
                              controller.toggleFavorite(deal);
                              Get.put(
                                FavoriteDealController(),
                              ).toggleFavoriteFromDeal(deal);
                            },
                            child: GetBuilder<SearchDealController>(
                              builder: (_) => Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.r),
                                  color: deal.isFavorite
                                      ? const Color.fromARGB(150, 155, 39, 176)
                                      : const Color.fromARGB(93, 155, 39, 176),
                                ),
                                child: Icon(
                                  deal.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: deal.isFavorite
                                      ? const Color(0xFF6B34AE)
                                      : Colors.black,
                                  size: 20,
                                ),
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
            child: GestureDetector(
              onTap: () => _showShareBottomSheet(context),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFf6B34AE),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Image.asset(IconPath.shareIcon, width: 20, height: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context, Widget child) {
    Get.bottomSheet(
      child,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
    );
  }

  void _showShareBottomSheet(BuildContext context) {
    _showBottomSheet(context, ShareBottomSheet(deal: deal));
  }

  void _showLoginBottomSheet(BuildContext context) {
    _showBottomSheet(
      context,
      DraggableScrollableSheet(
        initialChildSize: 0.3,
        minChildSize: 0.2,
        maxChildSize: 0.9,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFFCFE9), Color(0xFFF5E6F0)],
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 12.h),
                  Container(
                    width: 100,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 189, 153, 153),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login With ',
                        style: GlobalTextStyle.heading2.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Google',
                        style: GlobalTextStyle.heading1.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Explore clean,effective,and trend-forward beauty products in one place.',
                    textAlign: TextAlign.center,
                    style: GlobalTextStyle.bodyText.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Image.asset(
                        IconPath.googleIcon,
                        width: 24.w,
                        height: 24.h,
                      ),
                      label: Text(
                        'Sign in with Google',
                        style: GlobalTextStyle.bodyText.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6B34AE),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
