import 'package:bio_medika/controllers/drug_details_controller.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/helpers/get_name.dart';
import 'package:bio_medika/views/drug_details/widget/description_and_quantity/description_section.dart';
import 'package:bio_medika/views/drug_details/widget/description_and_quantity/quantity_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrugDetailDescriptionAndQuantity
    extends GetView<DrugDetailsControllerImp> {
  const DrugDetailDescriptionAndQuantity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
        left: AppConstants.val_22,
        right: AppConstants.val_22,
        top: size.height * 0.6,
        bottom: size.height * 0.075 + 40,
      ),
      child: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    const Spacer(),
                    DescriptionSection(
                        description: getTextLang(
                            nameEnglish: controller.medicationModel.detailsEn,
                            nameArabic: controller.medicationModel.detailsAr)),
                    const SizedBox(height: 15),
                    const Spacer(),
                    const QuantitySection(),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
