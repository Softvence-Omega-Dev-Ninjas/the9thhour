import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:the9thhour/core/common/style/global_text_style.dart';
import 'package:the9thhour/features/edit_preference_screen/screen/edit_preference_screen.dart';
import 'package:the9thhour/features/profile/controller/profile_controller.dart';
import 'package:the9thhour/features/profile/widgets/beauty_profile_card.dart';
import 'package:the9thhour/features/profile/widgets/profile_footer_section.dart';
import 'package:the9thhour/features/profile/widgets/profile_header_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        if (controller.isEditMode.value) {
          controller.closeEditPreference();
          return false;
        }
        return true;
      },
      child: Obx(() {
        if (controller.isEditMode.value) {
          return const EditPreferenceScreen();
        }
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFFFCFE9), Color(0xFFF5E6F0)],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Color(0xFfFFCFE9),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                    size: 20.0,
                  ),
                ),
              ),
              title: Text(
                'Profile',
                style: GlobalTextStyle.heading3.copyWith(fontSize: 22.sp),
              ),
              centerTitle: true,
            ),
            body: SafeArea(
              child: Obx(
                () => CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ProfileHeaderSection(
                              profileImage:
                                  controller.userProfile.value.profileImage,
                              name: controller.userProfile.value.name,
                              title: controller.userProfile.value.title,
                            ),
                            SizedBox(height: size.height * 0.03),
                            BeautyProfileCard(
                              skinTone: controller.userProfile.value.skinTone,
                              skinType: controller.userProfile.value.skinType,
                              hairType: controller.userProfile.value.hairType,
                              goal: controller.userProfile.value.goal,
                              budget: controller.userProfile.value.budget,
                              onEditPressed: controller.editPreference,
                            ),

                            SizedBox(height: 110),
                            ProfileFooterSection(
                              onLogoutPressed: controller.logout,
                            ),
                            SizedBox(height: 100),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
