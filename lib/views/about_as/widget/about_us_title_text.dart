import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:flutter/material.dart';

class AboutUsTitleText extends StatelessWidget {
  const AboutUsTitleText({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: AppConstants.val_10,
          right: AppConstants.val_10,
          top: AppConstants.val_2),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 16.5,
            fontWeight: FontWeight.bold,
            color: AppColor.secondary),
      ),
    );
  }
}
