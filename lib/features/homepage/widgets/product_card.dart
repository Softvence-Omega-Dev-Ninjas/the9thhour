import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the9thhour/core/common/constants/iconpath.dart';
import 'package:the9thhour/core/common/style/global_text_style.dart';
import 'package:the9thhour/core/common/widgets/custom_secondary_button.dart';

class ProductCard extends StatefulWidget {
  final String name;
  final String brand;
  final String price;
  final String originalPrice;
  final double rating;
  final int reviews;
  final String imageUrl;
  final VoidCallback onViewDeal;
  final VoidCallback onFavorite;

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
    required this.onFavorite,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isFavorited = false;

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
          // 1. Image Section - Expanded to fill available top space
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 282.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r),
                    ),
                    child: Image.asset(
                      widget.imageUrl,
                      //fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Icon(
                            Icons.image,
                            color: Colors.grey[400],
                            size: 40.sp,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 9.h,
                  right: 12.w,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF5E3E7E),
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(8.w),
                    child: Image(
                      image: AssetImage(IconPath.shareIcon),
                      width: 16.w,
                      height: 16.h,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 2. Details Section - Takes only the space it needs
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Rating and Reviews
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 12.sp),
                    SizedBox(width: 4.w),
                    Text(
                      '${widget.rating}',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '(${widget.reviews} reviews)',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 6.h),

                // Product Name
                Text(
                  widget.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GlobalTextStyle.bodyText.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 4.h),

                // Brand
                Text(
                  widget.brand,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GlobalTextStyle.bodyText.copyWith(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),

                SizedBox(height: 8.h),

                // Price Section
                Row(
                  children: [
                    Text(
                      widget.price,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF5E3E7E),
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      widget.originalPrice,
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10.h),

                // Actions Section
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 36.h,
                        child: CustomSecondaryButton(
                          text: 'View Deal',
                          onPressed: widget.onViewDeal,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isFavorited = !_isFavorited;
                        });
                        widget.onFavorite();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          color: _isFavorited
                              ? const Color.fromARGB(150, 155, 39, 176)
                              : const Color.fromARGB(93, 155, 39, 176),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Icon(
                              _isFavorited
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Color(0xFF6B34AE),
                              size: 16.sp,
                            ),
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
    );
  }
}
