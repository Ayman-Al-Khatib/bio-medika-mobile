import 'package:bio_medika/controllers/homa_page_controller.dart';
import 'package:bio_medika/core/constant/app_border_radius.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/enum/type_widget.dart';
import 'package:bio_medika/core/helpers/get_color_category.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:bio_medika/core/ui/shared/shimmer.dart';
import 'package:bio_medika/views/home/widget/custon_category_item_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isArabic = Get.find<MyAppServices>().appIsArabic();

    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * AppConstants.horizontalPadding,
      ),
      child: SizedBox(
        width: size.width * 0.851,
        height: size.width * 0.18 + AppConstants.val_16,
        child: GetBuilder<HomaePageControllerImp>(builder: (controller) {
          return ShimmerBioMedica(
            width: size.width * 0.18,
            height: size.height * 0.08,
            borderRadius: AppBorderRadius.borderRadius_20,
            loading: controller.statusRequest == StatusRequest.loading,
            typeWidget: TypeWidget.row,
            space: size.width * 0.04,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.listCategory.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left:
                        isArabic && index != controller.listCategory.length - 1
                            ? size.width * 0.04
                            : 0,
                    right:
                        isArabic || index == controller.listCategory.length - 1
                            ? 0
                            : size.width * 0.04,
                  ),
                  child: CategoryItemHome(
                    infoDes: getColorCategory(index),
                    width: size.width * 0.18,
                    height: size.width * 0.18 + AppConstants.val_16,
                    categoriesModel: controller.listCategory[index],
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}

/*
[
              CategoryItemHome(
                width: size.width * 0.18,
                height: size.height * 0.08,
                imagePath: AppAssetsPng.iheart,
                label: AppTextsEnglish.heart.tr,
                backgroundColor: AppColor.categoryItemBackground_1,
                itemColor: AppColor.categoryItemIcon_1,
              ),
              SizedBox(width: size.width * 0.04),
              CategoryItemHome(
                width: size.width * 0.18,
                height: size.height * 0.08,
                imagePath: AppAssetsPng.iCough,
                label: AppTextsEnglish.Cough.tr,
                backgroundColor: AppColor.categoryItemBackground_2,
                itemColor: AppColor.categoryItemIcon_2,
              ),
              SizedBox(width: size.width * 0.04),
              CategoryItemHome(
                width: size.width * 0.18,
                height: size.height * 0.08,
                imagePath: AppAssetsPng.iSodiumSupplements,
                label: AppTextsEnglish.Sodium.tr, //\nSupplements
                backgroundColor: AppColor.categoryItemBackground_3,
                itemColor: AppColor.categoryItemIcon_3,
              ),
              SizedBox(width: size.width * 0.04),
              CategoryItemHome(
                width: size.width * 0.18,
                height: size.height * 0.08,
                imagePath: AppAssetsPng.iAntimicrobials,
                label: AppTextsEnglish.Antimicrobials.tr,
                backgroundColor: AppColor.categoryItemBackground_4,
                itemColor: AppColor.categoryItemIcon_4,
              ),
            ],


 */
