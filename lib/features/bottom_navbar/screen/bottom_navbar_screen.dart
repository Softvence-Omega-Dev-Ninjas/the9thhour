import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:the9thhour/core/common/constants/app_colors.dart';
import 'package:the9thhour/core/common/constants/iconpath.dart';
import 'package:the9thhour/features/bottom_navbar/controller/bottom_navbar_controller.dart';
import 'package:the9thhour/features/favorite_deal/screen/favoite_deal_screen.dart';
import 'package:the9thhour/features/homepage/screen/home_screen.dart';
import 'package:the9thhour/features/profile/screen/profile_screen.dart';
import 'package:the9thhour/features/search_deal/screen/search_deal_screen.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavBarController controller = Get.put(NavBarController());

    final List<Widget> pages = [
      HomeScreen(),
      SearchDealScreen(),
      FavoriteDealScreen(),
      ProfileScreen(),
    ];

    final List<String> icons = [
      IconPath.homeIcon,
      IconPath.searchIcon,
      IconPath.favoriteIcon,
      IconPath.profileIcon,
    ];

    final List<String> labels = ["Home", "Search Deal", "Favorite", "Profile"];

    return Obx(
      () => Scaffold(
        backgroundColor: const Color(0xFFF5E6F0),
        body: pages[controller.currentIndex.value],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: const Color(0xFFF5E6F0)),
          padding: EdgeInsets.only(
            left: 30.w,
            right: 30.w,
            bottom: 46.h,
            top: 12.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(icons.length, (index) {
              bool isSelected = controller.currentIndex.value == index;
              return GestureDetector(
                onTap: () => controller.changeIndex(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      icons[index],
                      width: 24.w,
                      height: 24.h,
                      color: isSelected
                          ? AppColors.primaryTextColor
                          : AppColors.secondaryTextColor,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      labels[index],
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: isSelected
                            ? AppColors.primaryTextColor
                            : AppColors.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
