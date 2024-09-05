import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/models/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingTitle extends StatelessWidget {
  final OnboardingModel data;

  const OnboardingTitle({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Text(
      data.title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: AppConstants.val_20,
        fontWeight: FontWeight.w600,
        color: AppColor.black,
      ),
    );
  }
}
