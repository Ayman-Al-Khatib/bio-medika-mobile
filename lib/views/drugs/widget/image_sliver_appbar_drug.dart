import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/controllers/drug_controller.dart';
import 'package:bio_medika/core/helpers/get_name.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomImageSliverAppBarDrug extends StatelessWidget {
  const CustomImageSliverAppBarDrug({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.find<DrugControllerImp>();
    return SliverAppBar(
      backgroundColor: AppColor.categoryItemBackground_1,
      surfaceTintColor: AppColor.categoryItemBackground_1,
      elevation: AppConstants.val_0,
      automaticallyImplyLeading: false,
      pinned: true,
      centerTitle: true,
      stretch: true,
      stretchTriggerOffset: AppConstants.val_300,
      expandedHeight: min(size.height * 0.3, AppConstants.val_230),
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          controller.updateTitleOpacity(AppConstants.val_1 -
              (constraints.maxHeight - kToolbarHeight) /
                  (size.height * 0.3 - kToolbarHeight));
        });
        return FlexibleSpaceBar(
          stretchModes: const [
            StretchMode.zoomBackground,
          ],
          collapseMode: CollapseMode.parallax,
          background: Center(
            child: SizedBox(
              width: size.width * 0.45,
              height: size.width * 0.45,
              child: Hero(
                tag: controller.categoriesModel.imageUrl,
                child: CachedNetworkImage(
                  imageUrl: controller.categoriesModel.imageUrl,
                  color: AppColor.categoryItemIcon_1,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    size: AppConstants.val_28,
                    color: AppColor.categoryItemIcon_1,
                  ),
                ),
              ),
            ),
          ),
          centerTitle: true,
          expandedTitleScale: AppConstants.val_2,
          title: Obx(
            () => Opacity(
              opacity: controller.titleOpacity.value > 0.5
                  ? AppConstants.val_1
                  : controller.titleOpacity.value,
              child: AutoSizeText(
                getTextLang(
                    nameEnglish: controller.categoriesModel.nameEn,
                    nameArabic: controller.categoriesModel.nameAr),
                maxLines: 1,
                style: const TextStyle(
                  fontSize: AppConstants.val_28,
                  color: AppColor.categoryItemIcon_1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          titlePadding: const EdgeInsets.all(AppConstants.val_4),
        );
      }),
    );
  }
}
