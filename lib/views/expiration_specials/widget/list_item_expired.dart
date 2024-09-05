import 'package:bio_medika/controllers/expired_controller.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/ui/components/handling_data.dart';
import 'package:bio_medika/views/expiration_specials/widget/custom_expired_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListGridViewExpired extends StatelessWidget {
  const CustomListGridViewExpired({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        left: AppConstants.val_18,
        top: AppConstants.val_14,
        right: AppConstants.val_18,
        bottom: AppConstants.val_2,
      ),
      child: GetBuilder<ExpiredControllerImp>(builder: (controller) {
        return RequestStatusHandler(
          statusRequest: controller.statusRequest,
          height: size.height - size.height * 0.45 - AppConstants.val_55,
          isSliver: false,
          loading: false,
          needSearch: true,
          child: GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(AppConstants.val_2),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: AppConstants.val_15,
              mainAxisSpacing: AppConstants.val_15,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (BuildContext context, int index) {
              return CustomExpiredItem(
                medicationModel: controller.listDrug[index],
              );
            },
            itemCount: controller.listDrug.length,
          ),
        );
      }),
    );
  }
}
