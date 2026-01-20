import 'package:get/get_navigation/get_navigation.dart';
import 'package:the9thhour/features/bottom_navbar/screen/bottom_navbar_screen.dart';
import 'package:the9thhour/features/homepage/screen/home_screen.dart';
import 'package:the9thhour/features/onbording/screen/onbording_screen.dart';

class AppRoute {
  static String get onboardingScreen => '/onboardingScreen';
  static String get homeScreen => '/homeScreen';
  static String get bottomNavBarScreen => '/bottomNavBarScreen';

  static String getOnboardingScreen() => onboardingScreen;
  static String getHomeScreen() => homeScreen;
  static String getBottomNavBarScreen() => bottomNavBarScreen;

  static List<GetPage> routes = [
    GetPage(name: onboardingScreen, page: () => OnboardingScreen()),
    GetPage(name: homeScreen, page: () => HomeScreen()),
    GetPage(name: bottomNavBarScreen, page: () => NavBarScreen()),
  ];
}
