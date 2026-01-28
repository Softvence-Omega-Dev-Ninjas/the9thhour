import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:the9thhour/core/common/style/global_text_style.dart';
import 'package:the9thhour/core/common/widgets/custom_secondary_button.dart';
import 'package:the9thhour/features/homepage/controller/homepage_controller.dart';

class ProductDetails extends StatelessWidget {
  final String name;
  final String brand;
  final String price;
  final String originalPrice;
  final double rating;
  final int reviews;
  final VoidCallback onViewDeal;
  final HomePageController controller;
  final String productId;
  final int index;

  const ProductDetails({
    super.key,
    required this.name,
    required this.brand,
    required this.price,
    required this.originalPrice,
    required this.rating,
    required this.reviews,
    required this.onViewDeal,
    required this.controller,
    required this.productId,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              ..._buildRatingStars(rating),
              SizedBox(width: 4.w),
              Text(
                '$rating',
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                '($reviews reviews)',
                style: GlobalTextStyle.bodyText.copyWith(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Text(
            name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GlobalTextStyle.bodyText.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4),
          Text(
            brand,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GlobalTextStyle.bodyText.copyWith(
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                price,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFFA30293),
                ),
              ),
              SizedBox(width: 6.w),
              Text(
                originalPrice,
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 30,
                  child: CustomSecondaryButton(
                    text: 'View Deal',
                    onPressed: onViewDeal,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Obx(
                () => GestureDetector(
                  onTap: () => controller.toggleFavorite(index),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      color: controller.favoritedProductIds.contains(productId)
                          ? const Color.fromARGB(150, 155, 39, 176)
                          : const Color.fromARGB(93, 155, 39, 176),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Icon(
                          controller.favoritedProductIds.contains(productId)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: const Color(0xFF6B34AE),
                          size: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildRatingStars(double rating) {
    List<Widget> stars = [];
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    for (int i = 0; i < 5; i++) {
      if (i < fullStars) {
        stars.add(Icon(Icons.star, color: Colors.orange, size: 10.sp));
      } else if (i == fullStars && hasHalfStar) {
        stars.add(Icon(Icons.star_half, color: Colors.orange, size: 10.sp));
      } else {
        stars.add(Icon(Icons.star_border, color: Colors.grey, size: 10.sp));
      }
    }
    return stars;
  }
}
