import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_onboarding_list_informatoin.dart';
import 'package:bio_medika/controllers/onBording/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPageIndicator extends GetView<OnBoardingControllerImp> {
  const OnboardingPageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller.pageController,
      count: onboardingData.length,
      effect: const JumpingDotEffect(
        dotHeight: AppConstants.val_16,
        dotWidth: AppConstants.val_16,
        jumpScale: .6,
        verticalOffset: AppConstants.val_20,
        activeDotColor: AppColor.primary,
        spacing: AppConstants.val_10,
      ),
    );
  }
}
