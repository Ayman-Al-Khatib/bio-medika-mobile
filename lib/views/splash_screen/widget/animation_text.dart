import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedText extends StatelessWidget {
  final double opacityAnimation;
  final List<Color> colorizeColors;
  final TextStyle colorizeTextStyle;

  const AnimatedText({
    super.key,
    required this.opacityAnimation,
    required this.colorizeColors,
    required this.colorizeTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacityAnimation,
      child: AnimatedTextKit(
        animatedTexts: [
          ColorizeAnimatedText(
            AppTextsEnglish.Bio_Medika.tr,
            textStyle: colorizeTextStyle,
            colors: colorizeColors,
            speed: const Duration(milliseconds: 1200),
          ),
        ],
        isRepeatingAnimation: true,
        onTap: () {},
      ),
    );
  }
}
