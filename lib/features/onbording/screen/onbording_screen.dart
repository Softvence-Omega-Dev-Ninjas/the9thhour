import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the9thhour/core/common/constants/iconpath.dart';
import 'package:the9thhour/core/common/constants/imagepath.dart';
import 'package:the9thhour/core/common/style/global_text_style.dart';
import 'package:the9thhour/core/common/widgets/custom_primary_button.dart';
import 'package:the9thhour/routes/approute.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePath.onboardingBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 29.0,
            right: 29.0,
            top: 72.0,
            bottom: 38.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    IconPath.onboardingPageIcon,
                    width: 135.108,
                    height: 37.748,
                  ),
                  SizedBox(height: 27),
                  Text(
                    'Beauty That Knows You',
                    // style: GlobalTextStyle.heading1.copyWith(
                    //   fontStyle: FontStyle.italic,
                    // ),
                    style: GlobalTextStyle.heading1,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Discover the trusted essentials curated just for you & your beauty — anytime, anywhere.',
                    style: GlobalTextStyle.bodyText,
                  ),
                ],
              ),
              CustomPrimaryButton(
                text: 'Get Started',
                onPressed: () {
                  Get.toNamed(AppRoute.bottomNavBarScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
