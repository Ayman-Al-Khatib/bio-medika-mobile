import 'package:bio_medika/controllers/categories_controller.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/helpers/get_color_category.dart';
import 'package:bio_medika/core/ui/components/handling_data.dart';
import 'package:bio_medika/views/categories/widget/custom_categories_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListSliverAppBarCategory extends StatelessWidget {
  const CustomListSliverAppBarCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = (size.width -
            AppConstants.val_18 * AppConstants.val_2 -
            AppConstants.val_15 * AppConstants.val_2) /
        AppConstants.val_3;

    double height = width * AppConstants.val_10 / AppConstants.val_9;
    return SliverPadding(
      padding: const EdgeInsets.only(
        left: AppConstants.val_18,
        right: AppConstants.val_18,
        bottom: AppConstants.val_10,
      ),
      sliver: GetBuilder<CartegoriesControllerImp>(
        builder: (controller) {
          return RequestStatusHandler(
            statusRequest: controller.statusRequest,
            height: size.height - size.height * 0.45 - AppConstants.val_55,
            isSliver: true,
            loading: false,
            needSearch: true,
            child: GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.cartegorieslist.length * 3,
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
                  categoriesModel: controller.cartegorieslist[
                      index % controller.cartegorieslist.length],
                  infoDes: getColorCategory(index),
                  openCategory: controller.openCategory,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
