import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the9thhour/core/common/constants/imagepath.dart';
import '../controller/edit_preference_controller.dart';

class ProfileAvatarWidget extends StatelessWidget {
  const ProfileAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EditPreferenceController>();
    return Center(
      child: Stack(
        children: [
          Obx(
            () => CircleAvatar(
              radius: 56,
              backgroundColor: const Color(0xFFC84791),
          
              child: CircleAvatar(
                radius: 52,
                backgroundColor: const Color.fromARGB(255, 248, 185, 221),
                child: CircleAvatar(
                  radius: 48,
                  backgroundImage: controller.profileImage.value.isEmpty
                      ? AssetImage(ImagePath.profileImage)
                      : FileImage(File(controller.profileImage.value))
                            as ImageProvider,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 4,
            right: 4,
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                controller.pickImage();
              },
              child: CircleAvatar(
                radius: 14,
                backgroundColor: Color(0xFFC84791),
                child: Icon(Icons.camera_alt, size: 14, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
