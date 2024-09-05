import 'package:bio_medika/controllers/main_screen_controller.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileTopBar extends GetView<MainScreenControllerImp> {
  const ProfileTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.05),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(
              width: AppConstants.val_80,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Icon(Icons.arrow_back, color: AppColor.white),
              ),
            ),
            const Spacer(),
            Text(
              AppTextsEnglish.Profile.tr,
              style: const TextStyle(
                fontSize: AppConstants.val_20,
                fontWeight: FontWeight.w600,
                color: AppColor.white,
              ),
            ),
            const Spacer(),
            const SizedBox(width: AppConstants.val_80),
          ],
        ),
      ),
    );
  }
}
