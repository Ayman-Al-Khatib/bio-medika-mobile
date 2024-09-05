import 'package:bio_medika/controllers/categories_controller.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/views/home/widget/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchSliverAppBarCategory extends StatelessWidget {
  const CustomSearchSliverAppBarCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<CartegoriesControllerImp>(builder: (controller) {
      return SliverAppBar(
        backgroundColor: AppColor.background,
        elevation: AppConstants.val_0,
        surfaceTintColor: AppColor.background,
        pinned: true,
        expandedHeight: AppConstants.val_50,
        centerTitle: true,
        automaticallyImplyLeading: false,
        flexibleSpace: Center(
          child: SizedBox(
            child: CustomSearchBarWidget(
              controller: controller.searchController,
              focusNode: controller.focusNode,
              hint: AppTextsEnglish.Search_in_categories.tr,
              size: size,
              sideIcon: true,
              color: AppColor.backgroundExpired,
              cursorColor: AppColor.categoryItemIcon_1,
              backgroundColor: AppColor.categoryItemBackground_1,
            ),
          ),
        ),
      );
    });
  }
}
