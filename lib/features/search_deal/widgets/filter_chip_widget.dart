import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the9thhour/features/search_deal/controller/search_deal_controller.dart';

class FilterChipWidget extends StatelessWidget {
  final Map<String, dynamic> brand;
  final bool isSelected;
  final SearchDealController controller;

  const FilterChipWidget({super.key, required this.brand, this.isSelected = false, required this.controller});

  @override
  Widget build(BuildContext context) {
    final bool isText = brand['isText'] as bool? ?? false;
    final String label = brand['label'] as String;
    final String? iconPath = brand['icon'] as String?;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF6B34AE) : Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: isSelected ? Color(0xFF6B34AE) : Colors.transparent,
        ),
      ),
      child: isText
          ? Text(
              label,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Colors.black,
              ),
            )
          : Image.asset(
              iconPath ?? '',
              width: 65.w,
              height: 13.h,
              fit: BoxFit.contain,
            ),
    );
  }
}
