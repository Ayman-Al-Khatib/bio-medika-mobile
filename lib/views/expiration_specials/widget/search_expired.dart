import 'package:bio_medika/controllers/expired_controller.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/views/home/widget/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchAppBarExpired extends StatelessWidget {
  const CustomSearchAppBarExpired({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<ExpiredControllerImp>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(top: AppConstants.val_16),
        child: CustomSearchBarWidget(
          controller: controller.searchController,
          focusNode: controller.focusNode,
          hint: AppTextsEnglish.Search_Drug.tr,
          size: size,
          sideIcon: true,
          color: AppColor.white,
          textInputColor: AppColor.white,
          cursorColor: AppColor.white,
          backgroundColor: AppColor.categoryItemIcon_1,
        ),
      );
    });
  }
}
