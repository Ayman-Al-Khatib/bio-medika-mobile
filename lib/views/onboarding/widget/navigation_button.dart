import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_onboarding_list_informatoin.dart';
import 'package:bio_medika/controllers/onBording/onboarding_controller.dart';
import 'package:bio_medika/views/onboarding/widget/button_start_now.dart';
import 'package:bio_medika/views/onboarding/widget/custom_button_arrow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationButtons extends GetView<OnBoardingControllerImp> {
  const NavigationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //

          if (controller.currentPage.value > AppConstants.val_0)
            ButtonArrow(
                icon: Icons.arrow_back, onPressed: controller.previousPage),
          const Spacer(),
          if (controller.currentPage.value !=
              onboardingData.length - AppConstants.val_1)
            ButtonArrow(
                icon: Icons.arrow_forward, onPressed: controller.nextPage)
          //

          else
            const ButtonStartNow(),
          //

          //
        ],
      ),
    );
  }
}
