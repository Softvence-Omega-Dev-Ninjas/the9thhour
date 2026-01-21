import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:the9thhour/core/common/constants/iconpath.dart';
import 'package:the9thhour/core/common/style/global_text_style.dart';
import 'package:the9thhour/features/favorite_deal/controller/favorite_deal_controller.dart';
import 'package:the9thhour/features/search_deal/controller/search_deal_controller.dart';
import 'package:the9thhour/features/search_deal/model/deal_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DealCardWidget extends StatelessWidget {
  final DealModel deal;
  const DealCardWidget({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchDealController>();
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Image.asset(deal.image, height: 100, width: 150),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ...List.generate(5, (i) {
                            if (i < deal.rating.floor()) {
                              return const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              );
                            }
                            if (i == deal.rating.floor() &&
                                deal.rating.remainder(1) >= 0.5) {
                              return const Icon(
                                Icons.star_half,
                                color: Colors.amber,
                                size: 16,
                              );
                            }
                            return const Icon(
                              Icons.star_border,
                              color: Colors.amber,
                              size: 16,
                            );
                          }),
                          const SizedBox(width: 4),
                          Text(
                            '${deal.rating} (${deal.reviews} Reviews)',
                            style: GlobalTextStyle.heading2.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        deal.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GlobalTextStyle.bodyText.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'From: ${deal.brand}',
                        style: GlobalTextStyle.bodyText.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                '\$${deal.price}',
                                style: GlobalTextStyle.bodyText.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w800,
                                  color: const Color(0xFF5E3E7E),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                '\$${deal.oldPrice}',
                                style: GlobalTextStyle.bodyText.copyWith(
                                  fontSize: 11.sp,

                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF6B34AE),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              minimumSize: const Size(150, 30),
                            ),
                            child: const Text(
                              'View Deal',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: () {
                              controller.toggleFavorite(deal);
                              Get.put(
                                FavoriteDealController(),
                              ).toggleFavoriteFromDeal(deal);
                            },
                            child: GetBuilder<SearchDealController>(
                              builder: (_) => Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.r),
                                  color: deal.isFavorite
                                      ? const Color.fromARGB(150, 155, 39, 176)
                                      : const Color.fromARGB(93, 155, 39, 176),
                                ),
                                child: Icon(
                                  deal.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: deal.isFavorite
                                      ? const Color(0xFF6B34AE)
                                      : Colors.black,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 5,
            left: 5,
            child: GestureDetector(
              onTap: () => _showShareBottomSheet(context),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFf6B34AE),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Image.asset(IconPath.shareIcon, width: 20, height: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showShareBottomSheet(BuildContext context) {
    final String shareText = 'Check out ${deal.title} by ${deal.brand}!';

    Get.bottomSheet(
      DraggableScrollableSheet(
        initialChildSize: 0.45,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFFCFE9), Color(0xFFF5E6F0)],
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 12.h),
                  Container(
                    width: 100,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 189, 153, 153),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'Share With Friends',
                    style: GlobalTextStyle.heading2.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 6,
                    childAspectRatio: 0.8,
                    children: [
                      _buildShareOption(
                        icon: Icons.copy,
                        label: 'Copy Link',
                        color: Colors.grey.shade700,
                        onTap: () async {
                          await Clipboard.setData(
                            ClipboardData(text: shareText),
                          );
                          Get.back();
                          Get.snackbar(
                            'Success',
                            'Link copied to clipboard',
                            snackPosition: SnackPosition.BOTTOM,
                            margin: EdgeInsets.all(16.w),
                          );
                        },
                      ),
                      _buildShareOption(
                        icon: FontAwesomeIcons.whatsapp,
                        label: 'WhatsApp',
                        color: const Color(0xFF25D366),
                        onTap: () =>
                            _launchUrl('whatsapp://send?text=$shareText'),
                      ),
                      _buildShareOption(
                        icon: FontAwesomeIcons.facebook,
                        label: 'Facebook',
                        color: const Color(0xFF1877F2),
                        onTap: () => _launchUrl(
                          'https://www.facebook.com/sharer/sharer.php?u=example.com&quote=$shareText',
                        ),
                      ),
                      _buildShareOption(
                        icon: FontAwesomeIcons.facebookMessenger,
                        label: 'Messenger',
                        color: const Color(0xFF006AFF),
                        onTap: () => _launchUrl(
                          'fb-messenger://share/?link=example.com',
                        ),
                      ),
                      _buildShareOption(
                        icon: FontAwesomeIcons.twitter,
                        label: 'Twitter',
                        color: const Color(0xFF1DA1F2),
                        onTap: () => _launchUrl(
                          'https://twitter.com/intent/tweet?text=$shareText',
                        ),
                      ),
                      _buildShareOption(
                        icon: FontAwesomeIcons.instagram,
                        label: 'Instagram',
                        color: const Color(0xFFE4405F),
                        onTap: () => _launchUrl('instagram://share'),
                      ),
                      _buildShareOption(
                        icon: FontAwesomeIcons.skype,
                        label: 'Skype',
                        color: const Color(0xFF00AFF0),
                        onTap: () => _launchUrl('skype:?chat&topic=$shareText'),
                      ),
                      _buildShareOption(
                        icon: Icons.message,
                        label: 'Message',
                        color: const Color(0xFF5E3E7E),
                        onTap: () => Share.share(shareText),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          );
        },
      ),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
    );
  }

  Widget _buildShareOption({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Center(
              child: Icon(icon, color: color, size: 24.sp),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GlobalTextStyle.bodyText.copyWith(
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String urlString) async {
    Get.back();
    final Uri url = Uri.parse(urlString);
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        Share.share('Check out ${deal.title} by ${deal.brand}!');
      }
    } catch (e) {
      Share.share('Check out ${deal.title} by ${deal.brand}!');
    }
  }
}
