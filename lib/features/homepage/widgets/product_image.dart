import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the9thhour/core/common/constants/iconpath.dart';

class ProductImage extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onShareTap;

  const ProductImage({
    super.key,
    required this.imageUrl,
    required this.onShareTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 282.h,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/cardBackground.png'),
                fit: BoxFit.cover,
              ),
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
                imageUrl,
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
            child: GestureDetector(
              onTap: onShareTap,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF6B34AE),
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(8.w),
                child: Image(
                  image: AssetImage(IconPath.shareIcon),
                  width: 16.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
