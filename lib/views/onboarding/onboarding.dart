import 'package:bio_medika/controllers/onBording/onboarding_controller.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/ui/shared/background_image.dart';
import 'package:bio_medika/views/onboarding/widget/onboarding_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.secondary,
      body: Stack(
        children: [
          const BackgroundImage(),
          Positioned(top: size.height * 0.2, child: const OnboardingBody()),
        ],
      ),
    );
  }
}
