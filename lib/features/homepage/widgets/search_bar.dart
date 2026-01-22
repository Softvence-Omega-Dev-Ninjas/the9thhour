import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the9thhour/core/common/constants/iconpath.dart';
import 'package:the9thhour/features/homepage/controller/homepage_controller.dart';

class SearchBarWidget extends StatelessWidget {
  final HomePageController controller;

  const SearchBarWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.pink.withAlpha(30),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: TextField(
              onChanged: controller.updateSearchQuery,
              decoration: InputDecoration(
                hintText: 'Search beauty products...',
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                prefixIcon: null,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 12.h,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.transparent,
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(12.w),
          child: Image(
            width: 24.w,
            height: 24.h,
            image: AssetImage(IconPath.searchIcon),
          ),
        ),
      ],
    );
  }
}
