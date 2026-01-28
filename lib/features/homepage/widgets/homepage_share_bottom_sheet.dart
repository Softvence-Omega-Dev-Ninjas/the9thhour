import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:the9thhour/core/common/constants/iconpath.dart';
import 'package:the9thhour/core/common/style/global_text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class HomepageShareBottomSheet extends StatelessWidget {
  final String name;
  final String brand;

  const HomepageShareBottomSheet({
    super.key,
    required this.name,
    required this.brand,
  });

  @override
  Widget build(BuildContext context) {
    final String shareText = 'Check out $name by $brand!';
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.2,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Share With ',
                      style: GlobalTextStyle.heading2.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Friends',
                      style: GlobalTextStyle.heading1.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
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
                      imagePath: IconPath.copyIcon,
                      label: 'Copy Link',
                      onTap: () async {
                        Get.back();
                        await Clipboard.setData(ClipboardData(text: shareText));
                        Get.snackbar(
                          'Success',
                          'Link copied to clipboard',
                          snackPosition: SnackPosition.BOTTOM,
                          margin: EdgeInsets.all(16.w),
                        );
                      },
                    ),
                    _buildShareOption(
                      imagePath: IconPath.whatsappIcon,
                      label: 'WhatsApp',
                      onTap: () =>
                          _launchUrl('whatsapp://send?text=$shareText'),
                    ),
                    _buildShareOption(
                      imagePath: IconPath.facebookIcon,
                      label: 'Facebook',
                      onTap: () => _launchUrl(
                        'https://www.facebook.com/sharer/sharer.php?u=example.com&quote=$shareText',
                      ),
                    ),
                    _buildShareOption(
                      imagePath: IconPath.messengerIcon,
                      label: 'Messenger',
                      onTap: () =>
                          _launchUrl('fb-messenger://share/?link=example.com'),
                    ),
                    _buildShareOption(
                      imagePath: IconPath.twitterIcon,
                      label: 'Twitter',
                      onTap: () => _launchUrl(
                        'https://twitter.com/intent/tweet?text=$shareText',
                      ),
                    ),
                    _buildShareOption(
                      imagePath: IconPath.instagramIcon,
                      label: 'Instagram',
                      onTap: () => _launchUrl('instagram://share'),
                    ),
                    _buildShareOption(
                      imagePath: IconPath.skypeIcon,
                      label: 'Skype',
                      onTap: () => _launchUrl('skype:?chat&topic=$shareText'),
                    ),
                    _buildShareOption(
                      imagePath: IconPath.messageIcon,
                      label: 'Message',
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
    );
  }

  Widget _buildShareOption({
    required String imagePath,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60.w,
            height: 60.w,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Center(
              child: Image.asset(
                imagePath,
                width: 50,
                height: 50,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.share, size: 50, color: Colors.grey);
                },
              ),
            ),
          ),
          SizedBox(height: 8),
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
        Share.share('Check out $name by $brand!');
      }
    } catch (e) {
      Share.share('Check out $name by $brand!');
    }
  }
}
