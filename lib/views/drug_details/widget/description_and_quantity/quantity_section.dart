import 'package:bio_medika/controllers/drug_details_controller.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_fonts.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/services/my_services.dart';

import 'package:bio_medika/views/drug_details/widget/custom_quantity_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuantitySection extends GetView<DrugDetailsControllerImp> {
  const QuantitySection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isArabic = Get.find<MyAppServices>().appIsArabic();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppTextsEnglish.Quantity.tr,
          style: TextStyle(
            fontSize: AppConstants.val_18,
            height: AppConstants.val_1,
            color: controller.infoDes.$2,
            fontWeight: FontWeight.bold,
            fontFamily: AppFonts.amiri,
          ),
        ),
        const SizedBox(height: AppConstants.val_4),
        Padding(
          padding: const EdgeInsets.only(left: AppConstants.val_8),
          child: Row(
            children: [
              QuantityButton(
                icon: Icons.add,
                onPressed: () {
                  controller.addOrRemoveOne(isAdd: true);
                },
                onLongPress: () {
                  controller.addContinuous(isAdd: true);
                },
                left: !isArabic
                    ? const Radius.circular(AppConstants.val_12)
                    : const Radius.circular(AppConstants.val_0),
                right: !isArabic
                    ? const Radius.circular(AppConstants.val_0)
                    : const Radius.circular(AppConstants.val_12),
              ),
              QuantityButton(
                icon: Icons.remove,
                onPressed: () {
                  controller.addOrRemoveOne(isAdd: false);
                },
                onLongPress: () {
                  controller.addContinuous(isAdd: false);
                },
                left: isArabic
                    ? const Radius.circular(AppConstants.val_12)
                    : const Radius.circular(AppConstants.val_0),
                right: isArabic
                    ? const Radius.circular(AppConstants.val_0)
                    : const Radius.circular(AppConstants.val_12),
              ),
              const SizedBox(width: AppConstants.val_20),
              GetBuilder<DrugDetailsControllerImp>(builder: (controller) {
                return Text(
                  controller.quantity.toString(),
                  style: TextStyle(
                    fontSize: AppConstants.val_24,
                    height: AppConstants.val_1,
                    color: controller.infoDes.$2,
                    fontWeight: FontWeight.w700,
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
