import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/helpers/get_name.dart';
import 'package:bio_medika/models/categories_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final CategoriesModel categoriesModel;
  final (Color, Color, String) infoDes;

  final double width;
  final double height;
  final void Function(CategoriesModel) openCategory;
  const CategoryItem(
      {super.key,
      required this.width,
      required this.height,
      required this.categoriesModel,
      required this.infoDes,
      required this.openCategory});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openCategory(categoriesModel);
      },
      child: SizedBox(
        width: width,
        height: height,
        child: Column(
          children: [
            Container(
              width: width,
              height: height - 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppConstants.val_20),
                color: infoDes.$1,
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.val_16),
                child: CachedNetworkImage(
                  imageUrl: categoriesModel.imageUrl,
                  color: infoDes.$2,
                  placeholder: (context, url) => Container(
                      width: width,
                      height: height,
                      padding: EdgeInsets.all(width / AppConstants.val_8),
                      child: const CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    size: AppConstants.val_28,
                    color: infoDes.$2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppConstants.val_5),
            SizedBox(
              height: AppConstants.val_15,
              child: Text(
                getTextLang(
                    nameEnglish: categoriesModel.nameEn,
                    nameArabic: categoriesModel.nameAr),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  height: 1,
                  fontSize: AppConstants.val_13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
