import 'package:bio_medika/controllers/drug_details_controller.dart';
import 'package:bio_medika/core/ui/shared/background_image.dart';
import 'package:bio_medika/views/drug_details/widget/drug_details_container.dart';
import 'package:bio_medika/views/drug_details/widget/drug_details_description_and_quantity.dart';
import 'package:bio_medika/views/drug_details/widget/drug_details_favorite_and_image.dart';
import 'package:bio_medika/views/drug_details/widget/drug_details_price.dart';
import 'package:bio_medika/views/drug_details/widget/drug_details_top_bar.dart';
import 'package:bio_medika/views/drug_details/widget/drug_details_top_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrugDetailsBody extends GetView<DrugDetailsControllerImp> {
  const DrugDetailsBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(imagePath: controller.infoDes.$3),
        const DrugDetailsTopBar(),
        const DrugDetailsContainer(),
        const DrugDetailsFavoriteWithImage(),
        const DrugDetailsTopInfo(),
        const DrugDetailDescriptionAndQuantity(),
        const DrugDetailsPrice(),
      ],
    );
  }
}
