import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:the9thhour/core/common/constants/iconpath.dart';
import 'package:the9thhour/core/common/style/global_text_style.dart';
import 'package:the9thhour/features/homepage/controller/homepage_controller.dart';
import 'package:the9thhour/features/homepage/widgets/brand_chip.dart';
import 'package:the9thhour/features/homepage/widgets/product_card.dart';
import 'package:the9thhour/features/homepage/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controller using GetX
    final HomePageController controller = Get.put(HomePageController());

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color(0xFFF7D5E8), const Color(0xFFF5E6F0)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h),

                  // Header Section (Logo)
                  Image.asset(
                    IconPath.onboardingPageIcon,
                    width: 135.w,
                    height: 40.h,
                  ),

                  SizedBox(height: 22.h),

                  // Search Bar
                  SearchBarWidget(controller: controller),

                  SizedBox(height: 19.h),

                  // Explore Today's Best Deal Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Explore Today\'s\n',
                              style: GlobalTextStyle.heading2.copyWith(
                                fontSize: 24.sp,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            TextSpan(
                              text: 'Best Deal ',
                              style: GlobalTextStyle.heading1.copyWith(
                                fontSize: 24.sp,
                              ),
                            ),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Image.asset(
                                IconPath.fireIcon,
                                width: 20.w,
                                height: 22.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: controller.onSeeMore,
                        child: Text(
                          'See More >',
                          style: GlobalTextStyle.bodyText.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 22.h),

                  // Brand Filter Chips (Reactive)
                  Obx(
                    () => SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          controller.brands.length,
                          (index) => Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: GestureDetector(
                              onTap: () => controller.selectBrand(index),
                              child: BrandChip(
                                brand: controller.brands[index],
                                isSelected:
                                    controller.selectedBrandIndex.value ==
                                    index,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // Product Grid
                  // childAspectRatio: 0.68 provides enough height for the ProductCard content
                  // home_screen.dart
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 20.h,
                      // Change this from 0.68 to 0.6 or 0.58
                      // Lowering this number increases the height of the card.
                      childAspectRatio: 0.58,
                    ),
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      final product = controller.products[index];
                      return ProductCard(
                        name: product.name,
                        brand: product.brand,
                        price: product.price,
                        originalPrice: product.originalPrice,
                        rating: product.rating,
                        reviews: product.reviews,
                        imageUrl: product.imageUrl,
                        onViewDeal: () => controller.onViewDeal(index),
                        onFavorite: () => controller.onFavorite(index),
                      );
                    },
                  ),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
