import 'package:bio_medika/core/navigation/app_routes.dart';
import 'package:flutter/material.dart';

class SplashController {
  late AnimationController animationController;
  late Animation<double> rotationAnimation;
  late Animation<double> scaleAnimation;
  late Animation<double> opacityAnimation;

  void initState(TickerProvider vsync) {
    animationController = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 2),
    );

    rotationAnimation = Tween<double>(
      begin: 1.2 * 3.141592653589793,
      end: 8 * 3.141592653589793,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOutBack,
    ));

    scaleAnimation = Tween<double>(
      begin: 0.4,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    opacityAnimation = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
    ));

    animationController.forward();
    Future.delayed(const Duration(milliseconds: 3000),
        () => NavigationService.onboarding());
  }

  void dispose() {
    animationController.dispose();
  }
}
