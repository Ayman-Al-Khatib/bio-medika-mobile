import 'package:bio_medika/controllers/expired_controller.dart';
import 'package:bio_medika/core/constant/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomImageAppBarExpired extends StatelessWidget {
  const CustomImageAppBarExpired({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ExpiredControllerImp>();
    return Hero(
      tag: controller.image,
      child: Container(
        color: AppColor.categoryItemIcon_1,
        padding: const EdgeInsets.only(top: 30),
        child: Image.asset(
          controller.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
