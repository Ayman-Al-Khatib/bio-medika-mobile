import 'package:bio_medika/core/constant/app_onboarding_list_informatoin.dart';
import 'package:bio_medika/views/onboarding/widget/onboarding_item_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/onBording/onboarding_controller.dart';

class OnboardingPageView extends GetView<OnBoardingControllerImp> {
  const OnboardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.5,
      child: PageView.builder(
        controller: controller.pageController,
        itemCount: onboardingData.length,
        itemBuilder: (context, index) {
          return OnboardingItemView(data: onboardingData[index]);
        },
      ),
    );
  }
}
