import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:the9thhour/core/common/constants/iconpath.dart';
import 'package:the9thhour/core/common/style/global_text_style.dart';
import 'package:the9thhour/core/common/widgets/custom_secondary_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductCard extends StatefulWidget {
  final String name;
  final String brand;
  final String price;
  final String originalPrice;
  final double rating;
  final int reviews;
  final String imageUrl;
  final VoidCallback onViewDeal;
  final VoidCallback onFavorite;

  const ProductCard({
    super.key,
    required this.name,
    required this.brand,
    required this.price,
    required this.originalPrice,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
    required this.onViewDeal,
    required this.onFavorite,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 282.h,
                  decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/images/cardBackground.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r),
                    ),
                    child: Image.asset(
                      widget.imageUrl,

                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Icon(
                            Icons.image,
                            color: Colors.grey[400],
                            size: 40.sp,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 9.h,
                  right: 12.w,
                  child: GestureDetector(
                    onTap: () => _showShareBottomSheet(context),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF6B34AE),
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(8.w),
                      child: Image(
                        image: AssetImage(IconPath.shareIcon),
                        width: 16.w,
                        height: 16.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    ..._buildRatingStars(widget.rating),
                    SizedBox(width: 4.w),
                    Text(
                      '${widget.rating}',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '(${widget.reviews} reviews)',
                      style: GlobalTextStyle.bodyText.copyWith(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 6),

                // Product Name
                Text(
                  widget.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GlobalTextStyle.bodyText.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 4),

                // Brand
                Text(
                  widget.brand,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GlobalTextStyle.bodyText.copyWith(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 8.h),

                Row(
                  children: [
                    Text(
                      widget.price,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFFA30293),
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      widget.originalPrice,
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 30,
                        child: CustomSecondaryButton(
                          text: 'View Deal',
                          onPressed: widget.onViewDeal,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isFavorited = !_isFavorited;
                        });
                        widget.onFavorite();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          color: _isFavorited
                              ? const Color.fromARGB(150, 155, 39, 176)
                              : const Color.fromARGB(93, 155, 39, 176),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Icon(
                              _isFavorited
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Color(0xFF6B34AE),
                              size: 16.sp,
                            ),
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
    );
  }

  List<Widget> _buildRatingStars(double rating) {
    List<Widget> stars = [];
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    for (int i = 0; i < 5; i++) {
      if (i < fullStars) {
        stars.add(Icon(Icons.star, color: Colors.orange, size: 10.sp));
      } else if (i == fullStars && hasHalfStar) {
        stars.add(Icon(Icons.star_half, color: Colors.orange, size: 10.sp));
      } else {
        stars.add(Icon(Icons.star_border, color: Colors.grey, size: 10.sp));
      }
    }
    return stars;
  }

  void _showShareBottomSheet(BuildContext context) {
    final String shareText = 'Check out ${widget.name} by ${widget.brand}!';

    Get.bottomSheet(
      DraggableScrollableSheet(
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
                        imagePath: IconPath.copyIcon,
                        label: 'Copy Link',
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
                        onTap: () => _launchUrl(
                          'fb-messenger://share/?link=example.com',
                        ),
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
      ),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
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
        Share.share('Check out ${widget.name} by ${widget.brand}!');
      }
    } catch (e) {
      Share.share('Check out ${widget.name} by ${widget.brand}!');
    }
  }
}
