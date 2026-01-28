import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the9thhour/core/common/style/global_text_style.dart';

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
    final size = MediaQuery.of(context).size;
    // বাটনের হাইট স্ক্রিন অনুযায়ী ফিক্সড রাখা হলো যাতে চ্যাপ্টা না হয়
    final double buttonHeight = size.width > 600 ? 56.0 : 48.0;

    return Column(
      children: [
        SizedBox(height: size.height * 0.025),
        Text(
          appVersion,
          style: GlobalTextStyle.bodyText.copyWith(fontSize: 12),
        ),
        SizedBox(height: size.height * 0.005),
        Text(
          copyrightText,
          textAlign: TextAlign.center,
          style: GlobalTextStyle.bodyText.copyWith(fontSize: 12),
        ),
        SizedBox(height: size.height * 0.03),
        SizedBox(
          width: double.infinity,
          height: buttonHeight,
          child: ElevatedButton(
            onPressed: onLogoutPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6B34AE),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonHeight / 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Log Out',
                  style: GlobalTextStyle.bodyText.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 16.sp,
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
