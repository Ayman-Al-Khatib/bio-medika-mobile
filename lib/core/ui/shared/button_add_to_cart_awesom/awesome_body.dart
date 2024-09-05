import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/ui/shared/button_add_to_cart_awesom/quantity_input.dart';
import 'package:bio_medika/models/medication_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AwesomeBody extends StatelessWidget {
  const AwesomeBody({
    super.key,
    required this.itemColor,
    required this.backgroundColor,
    required this.medicationModel,
  });

  final Color itemColor;
  final Color backgroundColor;
  final MedicationModel medicationModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.val_12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            AppTextsEnglish.Quantity_needed.tr,
            style: TextStyle(
              fontSize: AppConstants.val_16,
              color: itemColor,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: AppConstants.val_12),
          QuantityInput(
            medicationModel: medicationModel,
            itemColor: itemColor,
          ),
        ],
      ),
    );
  }
}
