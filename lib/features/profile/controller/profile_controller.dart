import 'package:get/get.dart';
import 'package:the9thhour/core/common/constants/imagepath.dart';
import 'package:the9thhour/features/profile/models/profile_model.dart';

class ProfileController extends GetxController {
  late Rx<ProfileModel> userProfile;

  @override
  void onInit() {
    super.onInit();
    // Initialize with default user data
    userProfile = ProfileModel(
      id: '1',
      name: 'Katona Beatrix',
      title: 'Beauty Care Specialist',
      profileImage: ImagePath.profileImage, // Will be added later
      skinTone: 'Deep/Melanin-Rich',
      skinType: 'Oily',
      hairType: 'Straight',
      goal: 'Hydration & Definition',
      budget: '\$10 - \$99',
    ).obs;
  }

  void updateProfile(ProfileModel updatedProfile) {
    userProfile.value = updatedProfile;
  }

  void updateSkinTone(String skinTone) {
    userProfile.value = userProfile.value.copyWith(skinTone: skinTone);
  }

  void updateSkinType(String skinType) {
    userProfile.value = userProfile.value.copyWith(skinType: skinType);
  }

  void updateHairType(String hairType) {
    userProfile.value = userProfile.value.copyWith(hairType: hairType);
  }

  void updateGoal(String goal) {
    userProfile.value = userProfile.value.copyWith(goal: goal);
  }

  void updateBudget(String budget) {
    userProfile.value = userProfile.value.copyWith(budget: budget);
  }

  void editPreference() {
    // TODO: Navigate to edit preference screen
  }

  void logout() {
    // TODO: Implement logout logic
  }

  void navigateBack() {
    Get.back();
  }
}
