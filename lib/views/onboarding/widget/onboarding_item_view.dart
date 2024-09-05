import 'package:bio_medika/models/onboarding_model.dart';
import 'package:bio_medika/views/onboarding/widget/onboarding_image.dart';
import 'package:bio_medika/views/onboarding/widget/onboarding_text.dart';
import 'package:bio_medika/views/onboarding/widget/onboarding_title.dart';
import 'package:flutter/material.dart';

class OnboardingItemView extends StatelessWidget {
  final OnboardingModel data;

  const OnboardingItemView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        OnboardingImage(data: data, size: size),
        SizedBox(height: size.height * 0.025),
        OnboardingTitle(data: data),
        SizedBox(height: size.height * 0.02),
        OnboardingText(data: data),
      ],
    );
  }
}
