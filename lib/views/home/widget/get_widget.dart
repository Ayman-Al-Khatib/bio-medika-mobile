import 'package:bio_medika/controllers/homa_page_controller.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/enum/typy_search.dart';
import 'package:bio_medika/core/helpers/get_color_category.dart';
import 'package:bio_medika/core/navigation/app_routes.dart';
import 'package:bio_medika/views/categories/widget/custom_categories_item.dart';
import 'package:bio_medika/views/drugs/widget/custom_drug_item.dart';
import 'package:bio_medika/views/home/widget/categories_section.dart';
import 'package:bio_medika/views/home/widget/custom_section_title.dart';
import 'package:bio_medika/views/home/widget/expiration_specials.dart';
import 'package:bio_medika/views/home/widget/popular.dart';
import 'package:bio_medika/views/home/widget/today_offer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget getWidget(
    TypeSearch type, HomaePageControllerImp controller, String? lastSearch) {
  if (TypeSearch.inDrug == type &&
      lastSearch != null &&
      lastSearch.isNotEmpty) {
    return GridView.builder(
      padding: const EdgeInsets.only(
          left: AppConstants.val_20,
          right: AppConstants.val_20,
          bottom: AppConstants.val_78),
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppConstants.val_15,
        mainAxisSpacing: AppConstants.val_15,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (BuildContext context, int index) {
        return CustomDrugItem(
          medicationModel: controller.listMedication[index],
          goToDrugsDetails: controller.goToDrugsDetails,
          favorite: controller.favorite,
        );
      },
      itemCount: controller.listMedication.length,
    );
  }

  if (TypeSearch.inCategory == type &&
      lastSearch != null &&
      lastSearch.isNotEmpty) {
    final size = MediaQuery.of(Get.context!).size;

    double width = (size.width -
            AppConstants.val_18 * AppConstants.val_2 -
            AppConstants.val_15 * AppConstants.val_2) /
        AppConstants.val_3;

    double height = width * AppConstants.val_10 / AppConstants.val_9;
    return GridView.builder(
      padding: const EdgeInsets.only(
          left: AppConstants.val_18,
          right: AppConstants.val_18,
          bottom: AppConstants.val_78),
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: controller.listCategory.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: AppConstants.val_15,
        mainAxisSpacing: AppConstants.val_15,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (BuildContext context, int index) {
        return CategoryItem(
          width: width,
          height: height,
          categoriesModel: controller.listCategory[index],
          infoDes: getColorCategory(index),
          openCategory: controller.openCategory,
        );
      },
    );
  }

  return Column(
    children: [
      CustomSectionTitleWidget(title: AppTextsEnglish.Today_Offers.tr),

      const TodayOffersWidget(),

      CustomSectionTitleWidget(
          title: AppTextsEnglish.Categories.tr,
          onTap: () => NavigationService.categories()),

      const CategoriesSection(),

      CustomSectionTitleWidget(
        title: AppTextsEnglish.Popular_Drugs.tr,
      ),
      //
      const PopularWidget(),

      CustomSectionTitleWidget(
        top: AppConstants.val_11,
        title: AppTextsEnglish.Expiration_Specials.tr,
      ),

      const ExpirationSpecialsWidget(),
      const SizedBox(height: AppConstants.val_78),
    ],
  );
}
