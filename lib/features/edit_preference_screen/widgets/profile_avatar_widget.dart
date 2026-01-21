import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              radius: 52,
              backgroundColor: Colors.pink,
              child: CircleAvatar(
                radius: 48,
                backgroundImage: controller.profileImage.value.isEmpty
                    ? const AssetImage('assets/images/profile.png')
                    : FileImage(File(controller.profileImage.value))
                          as ImageProvider,
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
                backgroundColor: Colors.pink,
                child: Icon(Icons.camera_alt, size: 14, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
