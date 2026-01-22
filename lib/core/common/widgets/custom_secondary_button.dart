import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the9thhour/core/common/constants/iconpath.dart';
import 'package:the9thhour/core/common/style/global_text_style.dart';

class CustomSecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomSecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _showLoginBottomSheet(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF6B34AE),
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontFamily: GoogleFonts.playfairDisplay().fontFamily,
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  void _showLoginBottomSheet(BuildContext context) {
    Get.bottomSheet(
      DraggableScrollableSheet(
        initialChildSize: 0.3,
        minChildSize: 0.2,
        maxChildSize: 0.9,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFFCFE9), Color(0xFFF5E6F0)],
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 12.h),
                  Container(
                    width: 100,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 225, 166, 190),
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'Login With Google',
                    style: GlobalTextStyle.heading1.copyWith(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Explore clean,effective,and trend-forward beauty products in one place.',
                    textAlign: TextAlign.center,
                    style: GlobalTextStyle.bodyText.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Implement Google Sign In Logic
                        Get.back();
                      },
                      icon: Image.asset(
                        IconPath.googleIcon,
                        width: 20,
                        height: 20,
                      ),
                      label: const Text(
                        'Sign in with Google',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6B34AE),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          );
        },
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }
}
