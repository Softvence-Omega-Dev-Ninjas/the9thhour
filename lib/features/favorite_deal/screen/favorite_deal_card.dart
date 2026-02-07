import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:the9thhour/core/common/style/global_text_style.dart';
import 'package:the9thhour/features/favorite_deal/controller/favorite_deal_controller.dart';
import 'package:the9thhour/features/favorite_deal/screen/favorite_deal_item.dart';
import 'package:the9thhour/features/search_deal/model/deal_model.dart';

class FavoriteDealCard extends StatelessWidget {
  final DealModel product;
  final FavoriteDealController controller;

  const FavoriteDealCard({
    super.key,
    required this.product,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5.w, top: 10.h),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              DateFormat('dd MMM yyyy').format(DateTime.now()),
              style: GlobalTextStyle.bodyText.copyWith(),
            ),
          ),
        ),
        FavoriteDealItem(product: product, controller: controller),
      ],
    );
  }
}
