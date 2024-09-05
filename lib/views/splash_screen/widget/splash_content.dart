import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/views/splash_screen/widget/animation_text.dart';
import 'package:bio_medika/views/splash_screen/widget/splash_image.dart';
import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  final double rotationAnimation;
  final double scaleAnimation;
  final double opacityAnimation;
  final List<Color> colorizeColors;
  final TextStyle colorizeTextStyle;

  const SplashContent({
    super.key,
    required this.rotationAnimation,
    required this.scaleAnimation,
    required this.opacityAnimation,
    required this.colorizeColors,
    required this.colorizeTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedSplashImage(
          rotationAnimation: rotationAnimation,
          scaleAnimation: scaleAnimation,
          opacityAnimation: opacityAnimation,
        ),
        const SizedBox(height: AppConstants.val_8),
        AnimatedText(
          opacityAnimation: opacityAnimation,
          colorizeColors: colorizeColors,
          colorizeTextStyle: colorizeTextStyle,
        ),
      ],
    );
  }
}
