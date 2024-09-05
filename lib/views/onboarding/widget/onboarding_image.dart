import 'package:bio_medika/core/utils/show_image_svg.dart';
import 'package:bio_medika/models/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingImage extends StatelessWidget {
  final OnboardingModel data;
  final Size size;

  const OnboardingImage({super.key, required this.data, required this.size});

  @override
  Widget build(BuildContext context) {
    return ShowImageSvg(
      path: data.imagePath,
      isNeedColor: false,
      height: size.height * 0.3,
    );
  }
}
