import 'package:bio_medika/core/constant/app_assets_svg.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:flutter/widgets.dart';

(Color, Color, String) getColorCategory(int index) {
  late Color backgroundColor;
  late Color itemColor;
  late String imagePath;
  if (index % 4 == 0) {
    backgroundColor = AppColor.categoryItemBackground_1;
    itemColor = AppColor.categoryItemIcon_1;
    imagePath = AppAssetsSvg.backgroundDrugDetaios_1;
  }
  if (index % 4 == 1) {
    backgroundColor = AppColor.categoryItemBackground_2;
    itemColor = AppColor.categoryItemIcon_2;
    imagePath = AppAssetsSvg.backgroundDrugDetaios_2;
  }
  if (index % 4 == 2) {
    backgroundColor = AppColor.categoryItemBackground_3;
    itemColor = AppColor.categoryItemIcon_3;
    imagePath = AppAssetsSvg.backgroundDrugDetaios_3;
  }
  if (index % 4 == 3) {
    backgroundColor = AppColor.categoryItemBackground_4;
    itemColor = AppColor.categoryItemIcon_4;
    imagePath = AppAssetsSvg.backgroundDrugDetaios_4;
  }
  return (backgroundColor, itemColor, imagePath);
}
