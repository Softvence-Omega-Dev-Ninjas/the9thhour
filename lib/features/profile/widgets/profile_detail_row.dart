import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the9thhour/core/common/style/global_text_style.dart';

class ProfileDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final String iconPath;

  const ProfileDetailRow({
    super.key,
    required this.label,
    required this.value,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 20.w,
          child: Image.asset(iconPath, width: 20, height: 20),
        ),
        SizedBox(width: 8.w),
        SizedBox(
          width: 80.w,
          child: Text(
            label,
            style: GlobalTextStyle.heading2.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: GlobalTextStyle.heading2.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
