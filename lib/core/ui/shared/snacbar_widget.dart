import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> showCustomSnackbar(
    {required String title,
    required String message,
    Color backgroundColor = AppColor.primary,
    Color textColor = Colors.white,
    double borderRadius = AppConstants.val_10,
    EdgeInsets margin = const EdgeInsets.symmetric(
      horizontal: AppConstants.val_20,
      vertical: AppConstants.val_15,
    ),
    Duration duration = const Duration(seconds: 3),
    LinearGradient? backgroundGradient,
    SnackPosition? snackPosition}) async {
  if (!Get.isSnackbarOpen) {
    await Get.snackbar(
      title,
      message,
      messageText: Text(
        message,
        style: const TextStyle(
          color: AppColor.white,
          fontWeight: FontWeight.w500,
          fontSize: AppConstants.val_14,
        ),
      ),
      snackPosition: snackPosition ?? SnackPosition.BOTTOM,
      duration: duration,
      backgroundColor: backgroundColor,
      colorText: textColor,
      borderRadius: borderRadius,
      margin: margin,
      animationDuration: const Duration(milliseconds: 1500),
      backgroundGradient: backgroundGradient,
    ).future;
  }
}
