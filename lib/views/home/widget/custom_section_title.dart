import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSectionTitleWidget extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final double? top;
  const CustomSectionTitleWidget(
      {super.key, required this.title, this.onTap, this.top});

  @override
  Widget build(BuildContext context) {
    MyAppServices myAppServices = Get.find();
    return Padding(
        padding: EdgeInsets.only(
            top: top ?? AppConstants.val_14,
            left: !myAppServices.appIsArabic()
                ? AppConstants.val_16
                : AppConstants.val_0,
            right: myAppServices.appIsArabic()
                ? AppConstants.val_16
                : AppConstants.val_0,
            bottom: AppConstants.val_10),
        child: GestureDetector(
          onTap: () {
            if (onTap != null) {
              onTap!();
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [AppColor.primary, AppColor.pinkAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds);
                },
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: AppConstants.val_18,
                    color: Colors.white, // Set the text color to white
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
