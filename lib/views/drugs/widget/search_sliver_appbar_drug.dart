import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/controllers/drug_controller.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/views/home/widget/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchSliverAppBarDrug extends StatelessWidget {
  const CustomSearchSliverAppBarDrug({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<DrugControllerImp>(builder: (controller) {
      return Obx(
        () => SliverAppBar(
          automaticallyImplyLeading: false,
          surfaceTintColor: AppColor.categoryItemBackground_1,
          backgroundColor: controller.titleOpacity.value > 0.7
              ? AppColor.categoryItemBackground_1
              : Colors.transparent,
          elevation: AppConstants.val_0,
          pinned: true,
          expandedHeight: AppConstants.val_50,
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize: const Size(AppConstants.val_0, AppConstants.val_0),
              child: Container(
                color: AppColor.background,
                height: AppConstants.val_10,
              )),
          flexibleSpace: Center(
            child: SizedBox(
              child: CustomSearchBarWidget(
                controller: controller.searchController,
                focusNode: controller.focusNode,
                hint: AppTextsEnglish.Search_in_medicines.tr,
                size: size,
                sideIcon: true,
                color: AppColor.white,
                textInputColor: AppColor.white,
                backgroundColor: AppColor.categoryItemIcon_1,
                cursorColor: AppColor.categoryItemBackground_1,
              ),
            ),
          ),
        ),
      );
    });
  }
}
