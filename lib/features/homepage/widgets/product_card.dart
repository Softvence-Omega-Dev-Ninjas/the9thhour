import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:the9thhour/features/homepage/controller/homepage_controller.dart';
import 'package:the9thhour/features/homepage/widgets/homepage_share_bottom_sheet.dart';
import 'package:the9thhour/features/homepage/widgets/product_details.dart';
import 'package:the9thhour/features/homepage/widgets/product_image.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String brand;
  final String price;
  final String originalPrice;
  final double rating;
  final int reviews;
  final String imageUrl;
  final VoidCallback onViewDeal;
  final HomePageController controller;
  final String productId;
  final int index;

  const ProductCard({
    super.key,
    required this.name,
    required this.brand,
    required this.price,
    required this.originalPrice,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
    required this.onViewDeal,
    required this.controller,
    required this.productId,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImage(
            imageUrl: imageUrl,
            onShareTap: () => _showShareBottomSheet(context),
          ),
          ProductDetails(
            name: name,
            brand: brand,
            price: price,
            originalPrice: originalPrice,
            rating: rating,
            reviews: reviews,
            onViewDeal: onViewDeal,
            controller: controller,
            productId: productId,
            index: index,
          ),
        ],
      ),
    );
  }

  void _showShareBottomSheet(BuildContext context) {
    Get.bottomSheet(
      HomepageShareBottomSheet(name: name, brand: brand),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
    );
  }
}
