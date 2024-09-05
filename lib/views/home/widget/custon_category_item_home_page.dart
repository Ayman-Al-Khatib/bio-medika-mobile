import 'dart:math';

import 'package:bio_medika/controllers/homa_page_controller.dart';
import 'package:bio_medika/core/constant/app_border_radius.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/helpers/get_name.dart';
import 'package:bio_medika/models/categories_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';

class CategoryItemHome extends StatelessWidget {
  final (Color, Color, String) infoDes;
  final double width;
  final double height;
  final CategoriesModel categoriesModel;
  const CategoryItemHome(
      {super.key,
      required this.categoriesModel,
      required this.width,
      required this.height,
      required this.infoDes});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColor.noColor,
      onTap: () {
        Get.find<HomaePageControllerImp>().openCategory(categoriesModel);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(AppConstants.val_12),
            decoration: BoxDecoration(
              borderRadius: AppBorderRadius.borderRadius_20,
              color: infoDes.$1,
            ),
            width: width,
            height: height - AppConstants.val_16,
            child: Hero(
              tag: categoriesModel.imageUrl,
              child: CachedNetworkImage(
                imageUrl: categoriesModel.imageUrl,
                color: infoDes.$2,
                placeholder: (context, url) => ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: min(width, height) * 0.45,
                      maxWidth: min(width, height) * 0.45),
                  child: const CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  size: AppConstants.val_28,
                  color: infoDes.$2,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppConstants.val_2),
          SizedBox(
            height: AppConstants.val_14,
            width: width,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AutoSizeText(
                getTextLang(
                    nameEnglish: categoriesModel.nameEn,
                    nameArabic: categoriesModel.nameAr),
                maxLines: 2,
                maxFontSize: AppConstants.val_10,
                minFontSize: AppConstants.val_4,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: AppConstants.val_10,
                  fontWeight: FontWeight.w600,
                  height: 1.1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
