import 'package:bio_medika/controllers/expired_controller.dart';
import 'package:bio_medika/core/constant/app_border_radius.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/enum/type_widget.dart';
import 'package:bio_medika/core/ui/components/handling_data.dart';
import 'package:bio_medika/core/ui/shared/shimmer.dart';
import 'package:bio_medika/views/expiration_specials/widget/image_appbar_expired.dart';
import 'package:bio_medika/views/expiration_specials/widget/list_item_expired.dart';
import 'package:bio_medika/views/expiration_specials/widget/search_expired.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpiredBody extends StatelessWidget {
  const ExpiredBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExpiredControllerImp>(builder: (controller) {
      return RequestStatusHandler(
        statusRequest: controller.statusRequest,
        isTopImage: true,
        child: Column(
          children: [
            const CustomImageAppBarExpired(),
            Visibility(
                visible: controller.statusRequest != StatusRequest.loading &&
                    ((controller.listDrug.isEmpty &&
                            controller.lastSearch != null) ||
                        controller.listDrug.isNotEmpty),
                child: const CustomSearchAppBarExpired()),
            Visibility(
                visible: controller.statusRequest == StatusRequest.loading,
                child: const SizedBox(
                  height: AppConstants.val_14,
                )),
            Expanded(
              child: ShimmerBioMedica(
                  borderRadius: AppBorderRadius.borderRadius_10,
                  height: 100,
                  width: 100,
                  loading: controller.statusRequest == StatusRequest.loading,
                  typeWidget: TypeWidget.grid,
                  child: const CustomListGridViewExpired()),
            ),
          ],
        ),
      );
    });
  }
}
