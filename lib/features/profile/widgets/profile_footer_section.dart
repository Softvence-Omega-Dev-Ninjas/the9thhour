import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileFooterSection extends StatelessWidget {
  final VoidCallback onLogoutPressed;
  final String appVersion;
  final String copyrightText;

  const ProfileFooterSection({
    super.key,
    required this.onLogoutPressed,
    this.appVersion = 'App Version-v1.0',
    this.copyrightText = '©Copyright 2026 - All Right Reserved by The9thHour',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Text(
          appVersion,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          copyrightText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 24.h),
        SizedBox(
          width: double.infinity,
          height: 48.h,
          child: ElevatedButton(
            onPressed: onLogoutPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5E3E7E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 8.w),
                Icon(Icons.arrow_forward, size: 16.sp, color: Colors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
