import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/controllers/splash_controller.dart';
import 'package:bio_medika/core/constant/app_fonts.dart';
import 'package:bio_medika/views/splash_screen/widget/splash_content.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late SplashController _controller;

  @override
  void initState() {
    _controller = SplashController();
    _controller.initState(this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final colorizeColors = [
    AppColor.primary,
    AppColor.secondary,
    AppColor.primary,
    AppColor.secondary,
  ];

  final colorizeTextStyle = const TextStyle(
    fontSize: AppConstants.val_40,
    fontWeight: FontWeight.bold,
    fontFamily: AppFonts.montserrat,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller.animationController,
          builder: (context, child) {
            return SplashContent(
              rotationAnimation: _controller.rotationAnimation.value,
              scaleAnimation: _controller.scaleAnimation.value,
              opacityAnimation: _controller.opacityAnimation.value,
              colorizeColors: colorizeColors,
              colorizeTextStyle: colorizeTextStyle,
            );
          },
        ),
      ),
    );
  }
}
