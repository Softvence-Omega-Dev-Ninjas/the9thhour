import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with Title and Edit Button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Setup Beauty ',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Text(
              'Profile',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: onEditPressed,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFB83B9F),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                child: Row(
                  children: [
                    Text(
                      'Edit Preference',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(Icons.edit, size: 12.sp, color: Colors.white),
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
              _ProfileDetailRow(label: 'Budget:', value: budget, hasIcon: true),
            ],
          ),
        ),
      ],
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
