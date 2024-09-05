import 'package:bio_medika/controllers/homa_page_controller.dart';
import 'package:bio_medika/core/constant/app_border_radius.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/enum/type_widget.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:bio_medika/core/ui/shared/shimmer.dart';
import 'package:bio_medika/views/home/widget/custom_offer_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodayOffersWidget extends StatelessWidget {
  const TodayOffersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isArabic = Get.find<MyAppServices>().appIsArabic();
    final size = MediaQuery.of(context).size;
    final double space = size.width -
        size.width * 0.4 * 2 -
        size.width * AppConstants.horizontalPadding * 2;
    return Padding(
      padding: EdgeInsets.only(
        left: size.width * AppConstants.horizontalPadding,
        right: size.width * AppConstants.horizontalPadding,
      ),
      child: GetBuilder<HomaePageControllerImp>(builder: (controller) {
        return ShimmerBioMedica(
            width: size.width * 0.4,
            height: AppConstants.val_90,
            borderRadius: AppBorderRadius.borderRadius_20,
            loading: controller.statusRequest == StatusRequest.loading,
            typeWidget: TypeWidget.row,
            space: space,
            child: SizedBox(
              height: AppConstants.val_90,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.listDailySale.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: isArabic &&
                                  index != controller.listDailySale.length - 1
                              ? space
                              : 0,
                          right: isArabic ||
                                  index == controller.listDailySale.length - 1
                              ? 0
                              : space,
                        ),
                        child: CustomOfferItemWidget(
                          medicationModel: controller.listDailySale[index],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ));
      }),
    );
  }
}

// Row(
//             children = [
//               CustomOfferItemWidget(
//                 imagePath: AppAssetsPng.injection,
//                 label1: AppTextsEnglish.VAKSINASI_Line_BOOSTER.tr,
//               ),
//               const Spacer(),
//               CustomOfferItemWidget(
//                 imagePath: AppAssetsPng.tool,
//                 label1: AppTextsEnglish.LAYANAN.tr,
//                 label2: AppTextsEnglish.LAB_KLINIK.tr,
//               ),
//             ],
//           ),
