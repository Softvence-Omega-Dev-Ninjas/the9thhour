import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:the9thhour/core/common/style/global_text_style.dart';
import 'package:the9thhour/features/profile/controller/profile_controller.dart';
import '../controller/edit_preference_controller.dart';
import '../widgets/profile_avatar_widget.dart';
import '../widgets/preference_text_field.dart';
import '../widgets/selectable_chip_group.dart';

class EditPreferenceScreen extends GetView<EditPreferenceController> {
  const EditPreferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditPreferenceController());
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
            onPressed: () =>
                Get.find<ProfileController>().closeEditPreference(),
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
            'Edit Preference',
            style: GlobalTextStyle.heading3.copyWith(fontSize: 22.sp),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const ProfileAvatarWidget(),

                const SizedBox(height: 20),

                PreferenceTextField(
                  label: 'Your Name:',
                  initialValue: controller.preference.value.name,
                ),

                PreferenceTextField(
                  label: 'Your Title:',
                  initialValue: controller.preference.value.title,
                ),

                PreferenceTextField(
                  label: 'Your Goal:',
                  initialValue: controller.preference.value.goal,
                ),

                const SizedBox(height: 16),
                Text(
                  'Select Skin Tone:',
                  style: GlobalTextStyle.heading2.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 16),

                SelectableChipGroup(
                  options: controller.skinToneOptions,
                  selectedValue: controller.selectedSkinTone,
                  onSelected: controller.selectSkinTone,
                ),

                const SizedBox(height: 16),
                Text(
                  'Hair Type:',
                  style: GlobalTextStyle.heading2.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8),

                SelectableChipGroup(
                  options: controller.hairTypeOptions,
                  selectedValue: controller.selectedHairType,
                  onSelected: controller.selectHairType,
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
