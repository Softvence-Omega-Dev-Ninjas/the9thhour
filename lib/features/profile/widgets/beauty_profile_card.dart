import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the9thhour/core/common/constants/app_colors.dart';
import 'package:the9thhour/core/common/style/global_text_style.dart';
import 'package:the9thhour/core/common/widgets/custom_secondary_button.dart';

class BeautyProfileCard extends StatelessWidget {
  final String skinTone;
  final String skinType;
  final String hairType;
  final String goal;
  final String budget;
  final VoidCallback onEditPressed;

  const BeautyProfileCard({
    super.key,
    required this.skinTone,
    required this.skinType,
    required this.hairType,
    required this.goal,
    required this.budget,
    required this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF7D5E8),
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(color: Color(0xFFD8BBC7), width: 0.5.w),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Title and Edit Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Setup Beauty ',
                  style: GlobalTextStyle.heading2.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Profile',
                  style: GlobalTextStyle.heading1.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                //SizedBox(width: 8.w),
                GestureDetector(
                  onTap: onEditPressed,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFB83B9F),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 13.w,
                      vertical: 8.h,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Edit Preference',
                          style: GlobalTextStyle.bodyText.copyWith(
                            fontSize: 12.sp,
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Icon(
                          Icons.edit_outlined,
                          size: 12.sp,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            // White Card with Details
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8.r,
                    offset: Offset(0, 2.h),
                  ),
                ],
              ),
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  _ProfileDetailRow(
                    label: 'Skin Tone:',
                    value: skinTone,
                    hasIcon: true,
                  ),
                  SizedBox(height: 12.h),
                  _ProfileDetailRow(
                    label: 'Skin Type:',
                    value: skinType,
                    hasIcon: true,
                  ),
                  SizedBox(height: 12.h),
                  _ProfileDetailRow(
                    label: 'Hair Type:',
                    value: hairType,
                    hasIcon: true,
                  ),
                  SizedBox(height: 12.h),
                  _ProfileDetailRow(label: 'Goal:', value: goal, hasIcon: true),
                  SizedBox(height: 12.h),
                  _ProfileDetailRow(
                    label: 'Budget:',
                    value: budget,
                    hasIcon: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool hasIcon;

  const _ProfileDetailRow({
    required this.label,
    required this.value,
    required this.hasIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (hasIcon)
          SizedBox(
            width: 20.w,
            child: Icon(Icons.circle, size: 8.sp, color: Colors.black),
          )
        else
          SizedBox(width: 20.w),
        SizedBox(width: 8.w),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
