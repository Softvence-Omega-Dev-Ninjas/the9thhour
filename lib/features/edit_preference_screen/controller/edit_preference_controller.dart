import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:the9thhour/features/edit_preference_screen/models/preference_model.dart';

class EditPreferenceController extends GetxController {
  final preference = PreferenceModel(
    name: 'Katona Beatrix',
    title: 'Beauty Care Specialist',
    goal: 'Hydration & Definition',
  ).obs;

  final skinToneOptions = [
    'All',
    'Normal',
    'Oily',
    'Dry',
    'Combination',
    'Sensitive',
    'Acne Prone',
    'Oily Acne Prone',
  ];

  final hairTypeOptions = [
    'All',
    'Curly',
    'Fine',
    'Straight',
    'Wavy',
    'Textured',
    'Dry',
    'Normal',
    'Oily',
  ];

  var selectedSkinTone = 'Oily'.obs;
  var selectedHairType = 'Straight'.obs;

  final ImagePicker _picker = ImagePicker();
  var profileImage = ''.obs;

  Future<void> pickImage() async {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                Get.back();
                _getImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                Get.back();
                _getImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        profileImage.value = image.path;
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  void selectSkinTone(String value) {
    selectedSkinTone.value = value;
  }

  void selectHairType(String value) {
    selectedHairType.value = value;
  }
}
