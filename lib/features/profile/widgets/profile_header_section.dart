import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        Row(
          children: [
            // GestureDetector(
            //   //onTap: onBackPressed,
            //   child: Icon(Icons.arrow_back, size: 24.sp),
            // ),
            SizedBox(width: 16.w),
            Expanded(
              child: Center(
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(width: 40.w), // For alignment
          ],
        ),
        SizedBox(height: 24.h),
        // Profile Section
        Row(
          children: [
            // Profile Image
            Container(
              width: 80.w,
              height: 80.w,
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
            SizedBox(width: 16.w),
            // Name and Title
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
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
