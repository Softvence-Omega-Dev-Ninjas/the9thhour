import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the9thhour/core/common/constants/iconpath.dart';
import 'package:the9thhour/core/common/style/global_text_style.dart';
import 'package:the9thhour/features/favorite_deal/controller/favorite_deal_controller.dart';
import 'package:the9thhour/features/search_deal/model/deal_model.dart';

class FavoriteDealItem extends StatelessWidget {
  final DealModel product;
  final FavoriteDealController controller;

  const FavoriteDealItem({
    super.key,
    required this.product,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 8, top: 5),
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
                Image.asset(product.image, height: 100, width: 150),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ...List.generate(5, (i) {
                            if (i < product.rating.floor()) {
                              return const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              );
                            }
                            if (i == product.rating.floor() &&
                                product.rating.remainder(1) >= 0.5) {
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
                          Flexible(
                            child: Text(
                              '${product.rating} (${product.reviews} Reviews)',
                              overflow: TextOverflow.ellipsis,
                              style: GlobalTextStyle.bodyText.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
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
                        style: GlobalTextStyle.heading2.copyWith(fontSize: 12),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "\$${product.price}",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w800,
                                  color: const Color(0xFFA30293),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '\$${product.oldPrice}',
                                style: const TextStyle(
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
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF6B34AE),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                minimumSize: const Size(0, 30),
                              ),
                              child: const FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'View Deal',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: () {
                              controller.removeFromFavorites(product);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
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
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Image.asset(IconPath.shareIcon, width: 20, height: 20),
            ),
          ),
        ],
      ),
    );
  }
}
