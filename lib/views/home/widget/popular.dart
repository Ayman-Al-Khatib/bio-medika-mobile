import 'package:bio_medika/controllers/homa_page_controller.dart';
import 'package:bio_medika/core/constant/app_border_radius.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/enum/type_widget.dart';
import 'package:bio_medika/core/helpers/get_color_category.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:bio_medika/core/ui/shared/shimmer.dart';
import 'package:bio_medika/views/home/widget/custom_popular_item.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isArabic = Get.find<MyAppServices>().appIsArabic();

    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width *
              AppConstants.horizontalPadding,
        ),
        child: SizedBox(
          height: size.width * 0.22 + AppConstants.val_18,
          child: GetBuilder<HomaePageControllerImp>(builder: (controller) {
            return ShimmerBioMedica(
              width: size.width * 0.26,
              height: size.width * 0.22,
              borderRadius: AppBorderRadius.borderRadius_20,
              loading: controller.statusRequest == StatusRequest.loading,
              typeWidget: TypeWidget.row,
              space: size.width * 0.034,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: controller.listMostPopular.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: isArabic &&
                              (index != controller.listMostPopular.length - 1)
                          ? size.width * 0.034
                          : 0,
                      right: isArabic ||
                              (index == controller.listMostPopular.length - 1)
                          ? 0
                          : size.width * 0.034,
                    ),
                    child: CustomPopularItem(
                        label: AppTextsEnglish.Insulin.tr,
                        infoDes: getColorCategory(index + 2),
                        medicationModel: controller.listMostPopular[index]),
                  );
                },
              ),
            );
          }),
        ));
  }
}

/*

children: [
            CustomPopularItem(
                label: AppTextsEnglish.Insulin.tr,
                backgroundColor: AppColor.categoryItemBackground_1,
                imagePath: AppAssetsPng.dinsulin),
            //!
            SizedBox(width: size.width * 0.034),
            //!
            CustomPopularItem(
                label: AppTextsEnglish.Omeprazole.tr,
                backgroundColor: AppColor.categoryItemBackground_2,
                imagePath: AppAssetsPng.domeprazole),
            //!
            SizedBox(width: size.width * 0.034),
            //!
            CustomPopularItem(
                label: AppTextsEnglish.Celecoxib.tr,
                backgroundColor: AppColor.categoryItemBackground_3,
                imagePath: AppAssetsPng.dcelecoxib),
            //!
            SizedBox(width: size.width * 0.034),
            //!
            CustomPopularItem(
                label: AppTextsEnglish.Glipizide.tr,
                backgroundColor: AppColor.categoryItemBackground_4,
                imagePath: AppAssetsPng.dglipizide),
          ],

*/
