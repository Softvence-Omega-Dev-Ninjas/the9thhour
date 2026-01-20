import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the9thhour/routes/approute.dart';
import 'core/binding/controller_binder.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoute.onboardingScreen,
          getPages: AppRoute.routes,
          builder: EasyLoading.init(),
          initialBinding: ControllerBinder(),
          themeMode: ThemeMode.system,
        );
      },
    );
  }
}
