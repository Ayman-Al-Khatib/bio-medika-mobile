import 'package:bio_medika/core/constant/app_assets_png.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:flutter/material.dart';

class AnimatedSplashImage extends StatelessWidget {
  final double rotationAnimation;
  final double scaleAnimation;
  final double opacityAnimation;

  const AnimatedSplashImage({
    super.key,
    required this.rotationAnimation,
    required this.scaleAnimation,
    required this.opacityAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotationAnimation,
      child: Opacity(
        opacity: opacityAnimation,
        child: Transform.scale(
          scale: scaleAnimation,
          child: Image.asset(
            AppAssetsPng.logo, // Replace with your image asset
            width: AppConstants.val_150,
            height: AppConstants.val_150,
          ),
        ),
      ),
    );
  }
}
