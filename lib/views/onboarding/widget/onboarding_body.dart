import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/views/onboarding/widget/navigation_button.dart';
import 'package:bio_medika/views/onboarding/widget/onboarding_page_indicator.dart';
import 'package:bio_medika/views/onboarding/widget/onboarding_page_view.dart';
import 'package:flutter/material.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
          left: AppConstants.val_30,
          right: AppConstants.val_30,
          top: size.height * 0.1),
      clipBehavior: Clip.hardEdge,
      height: size.height * 0.8,
      width: size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppConstants.val_30),
        ),
        color: AppColor.background,
      ),
      child: Column(
        children: [
          const OnboardingPageView(),
          SizedBox(height: size.height * 0.04),
          const OnboardingPageIndicator(),
          const Spacer(),
          const NavigationButtons(),
          SizedBox(height: size.height * 0.03),
        ],
      ),
    );
  }
}
