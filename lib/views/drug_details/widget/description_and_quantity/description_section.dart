import 'package:bio_medika/controllers/drug_details_controller.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_fonts.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DescriptionSection extends GetView<DrugDetailsControllerImp> {
  final String description;
  const DescriptionSection({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTextsEnglish.Description.tr,
            style: TextStyle(
              fontSize: AppConstants.val_18,
              height: 1,
              color: controller.infoDes.$2,
              fontWeight: FontWeight.w700,
              fontFamily: AppFonts.amiri,
            ),
          ),
          const SizedBox(height: AppConstants.val_2),
          Text(
            description,
            style: const TextStyle(
              fontSize: AppConstants.val_12,
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
