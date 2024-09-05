import 'package:bio_medika/core/constant/app_border_radius.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/controllers/onBording/onboarding_controller.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonStartNow extends GetView<OnBoardingControllerImp> {
  const ButtonStartNow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToLogin();
      },
      child: Container(
        decoration: const BoxDecoration(
          color: AppColor.primary,
          borderRadius: AppBorderRadius.borderRadius_24,
        ),
        height: AppConstants.val_40,
        width: AppConstants.val_80,
        child: Center(
          child: Text(
            AppTextsEnglish.Start_Now.tr,
            style: const TextStyle(
              fontSize: AppConstants.val_10,
              color: AppColor.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
