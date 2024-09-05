import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/models/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingText extends StatelessWidget {
  final OnboardingModel data;

  const OnboardingText({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.val_20),
      child: Text(
        data.body,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: AppConstants.val_14,
          fontWeight: FontWeight.w600,
          color: AppColor.iconAndTextGrey,
        ),
      ),
    );
  }
}
