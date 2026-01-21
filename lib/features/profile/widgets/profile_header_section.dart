import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the9thhour/core/common/style/global_text_style.dart';

class ProfileHeaderSection extends StatelessWidget {
  final String profileImage;
  final String name;
  final String title;
  //final VoidCallback onBackPressed;
  const ProfileHeaderSection({
    super.key,
    required this.profileImage,
    required this.name,
    required this.title,
    //required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Back Button and Title
        // Profile Section
        Row(
          children: [
            // Profile Image
            Container(
              width: 72.w,
              height: 72.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              child: profileImage.isEmpty
                  ? Icon(Icons.person, size: 40.sp, color: Colors.grey[600])
                  : ClipOval(
                      child: Image.asset(profileImage, fit: BoxFit.cover),
                    ),
            ),
            SizedBox(width: 20.w),
            // Name and Title
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: GlobalTextStyle.heading2.copyWith(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  title,
                  style: GlobalTextStyle.bodyText.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
