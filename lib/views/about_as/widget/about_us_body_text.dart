import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsBodyText extends StatelessWidget {
  const AboutUsBodyText({
    super.key,
    required this.body,
  });
  final String body;
  @override
  Widget build(BuildContext context) {
    final bool isArabic = Get.find<MyAppServices>().appIsArabic();
    return Padding(
      padding: EdgeInsets.only(
          left: isArabic ? AppConstants.val_10 : AppConstants.val_14,
          right: !isArabic ? AppConstants.val_10 : AppConstants.val_14,
          top: AppConstants.val_2,
          bottom: AppConstants.val_4),
      child: Text(
        body,
        style: const TextStyle(
            color: AppColor.iconAndTextGrey,
            fontWeight: FontWeight.w500,
            fontSize: AppConstants.val_13,
            fontFamily: '0'),
      ),
    );
  }
}
