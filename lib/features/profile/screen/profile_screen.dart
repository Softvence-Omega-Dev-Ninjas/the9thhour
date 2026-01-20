import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:the9thhour/features/profile/controller/profile_controller.dart';
import 'package:the9thhour/features/profile/widgets/beauty_profile_card.dart';
import 'package:the9thhour/features/profile/widgets/profile_footer_section.dart';
import 'package:the9thhour/features/profile/widgets/profile_header_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color(0xFFFFCFE9), const Color(0xFFF5E6F0)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Section
                    ProfileHeaderSection(
                      profileImage: controller.userProfile.value.profileImage,
                      name: controller.userProfile.value.name,
                      title: controller.userProfile.value.title,
                    ),

                    SizedBox(height: 24.h),

                    // Beauty Profile Card
                    BeautyProfileCard(
                      skinTone: controller.userProfile.value.skinTone,
                      skinType: controller.userProfile.value.skinType,
                      hairType: controller.userProfile.value.hairType,
                      goal: controller.userProfile.value.goal,
                      budget: controller.userProfile.value.budget,
                      onEditPressed: controller.editPreference,
                    ),

                    // Footer Section
                    ProfileFooterSection(onLogoutPressed: controller.logout),

                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
