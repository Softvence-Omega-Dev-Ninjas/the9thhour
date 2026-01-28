import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the9thhour/core/common/constants/iconpath.dart';
import 'package:the9thhour/core/common/style/global_text_style.dart';
import 'package:the9thhour/features/profile/widgets/profile_detail_row.dart';

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
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF7D5E8),
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(
          color: const Color.fromARGB(255, 236, 197, 223),
          width: 0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Row(
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
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: onEditPressed,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFB83B9F),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Edit Preference',
                          style: GlobalTextStyle.bodyText.copyWith(
                            fontSize: 10.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Icon(
                          Icons.edit_outlined,
                          size: 10.sp,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: const Color(0xFFE8E8E8)),
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
                  SizedBox(height: 6),
                  ProfileDetailRow(
                    label: 'Skin Tone:',
                    value: skinTone,
                    iconPath: IconPath.mediumskin,
                  ),
                  SizedBox(height: 6),
                  const Divider(color: Color(0xFFF7D5E8), thickness: 1),
                  SizedBox(height: 6),
                  ProfileDetailRow(
                    label: 'Skin Type:',
                    value: skinType,
                    iconPath: IconPath.lightskin,
                  ),
                  SizedBox(height: 6),
                  const Divider(color: Color(0xFFF7D5E8), thickness: 1),
                  SizedBox(height: 6),
                  ProfileDetailRow(
                    label: 'Hair Type:',
                    value: hairType,
                    iconPath: IconPath.redhair,
                  ),
                  SizedBox(height: 6),
                  const Divider(color: Color(0xFFF7D5E8), thickness: 1),
                  SizedBox(height: 6),
                  ProfileDetailRow(
                    label: 'Goal:',
                    value: goal,
                    iconPath: IconPath.campaignIcon,
                  ),
                  SizedBox(height: 6),
                  const Divider(color: Color(0xFFF7D5E8), thickness: 1),
                  SizedBox(height: 6),
                  ProfileDetailRow(
                    label: 'Budget:',
                    value: budget,
                    iconPath: IconPath.handIcon,
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
