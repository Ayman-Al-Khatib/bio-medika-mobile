import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDrugsDetailsItemTotalPrice extends StatelessWidget {
  const OrderDrugsDetailsItemTotalPrice({
    super.key,
    required this.totalPrice,
  });
  final String totalPrice;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppConstants.val_5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppTextsEnglish.totalPrice.tr,
            style: const TextStyle(
              fontSize: AppConstants.val_12,
              color: AppColor.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            totalPrice,
            style: const TextStyle(
              fontSize: AppConstants.val_12,
              color: AppColor.profilePackground_2,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
