import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:the9thhour/core/common/constants/iconpath.dart';
import 'package:the9thhour/core/common/style/global_text_style.dart';
import 'package:the9thhour/features/favorite_deal/controller/favorite_deal_controller.dart';
import 'package:the9thhour/features/search_deal/controller/search_deal_controller.dart';
import 'package:the9thhour/features/search_deal/model/deal_model.dart';

class DealCardWidget extends StatelessWidget {
  final DealModel deal;
  const DealCardWidget({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchDealController>();
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        children: [
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
                            style: GlobalTextStyle.heading2.copyWith(
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
                                '\$${deal.price}',
                                style: GlobalTextStyle.bodyText.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w800,
                                  color: const Color(0xFF5E3E7E),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                '\$${deal.oldPrice}',
                                style: GlobalTextStyle.bodyText.copyWith(
                                  fontSize: 11.sp,
                                  
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
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF6B34AE),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              minimumSize: const Size(150, 30),
                            ),
                            child: const Text(
                              'View Deal',
                              style: TextStyle(color: Colors.white),
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
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xFf6B34AE),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Image.asset(IconPath.shareIcon, width: 20, height: 20),
            ),
          ),
        ],
      ),
    );
  }
}
