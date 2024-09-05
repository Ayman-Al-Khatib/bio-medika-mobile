import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/views/home/widget/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/favorite_controller.dart';

class CustomSearchAppBarFavorite extends GetView<FavoriteControllerImp> {
  const CustomSearchAppBarFavorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        child: CustomSearchBarWidget(
          controller: controller.searchController,
          focusNode: controller.focusNode,
          hint: AppTextsEnglish.Search_in_favorites.tr,
          size: size,
          sideIcon: false,
          color: AppColor.categoryItemIcon_1,
          backgroundColor: AppColor.categoryItemBackground_1,
        ),
      ),
    );
  }
}
