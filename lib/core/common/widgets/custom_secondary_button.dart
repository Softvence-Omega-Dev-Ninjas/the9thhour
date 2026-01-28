import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomSecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontSize,
    this.fontWeight,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.w,
      height: 50.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF6B34AE),
          fixedSize: Size(250.w, 50.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontFamily: GoogleFonts.playfairDisplay().fontFamily,
            fontSize: fontSize ?? 30.0,
            fontWeight: fontWeight ?? FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
