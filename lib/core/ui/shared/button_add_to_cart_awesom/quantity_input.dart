import 'package:bio_medika/controllers/tiny_tasks/up_price_awesom_controller.dart';
import 'package:bio_medika/core/constant/app_border_radius.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/models/medication_model.dart';
import 'package:bio_medika/views/drug_details/widget/value_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class QuantityInput extends GetView<AwesomeControllerImp> {
  const QuantityInput({
    super.key,
    required this.medicationModel,
    required this.itemColor,
  });
  final MedicationModel medicationModel;
  final Color itemColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppConstants.val_45,
          width: size.width * 0.28,
          child: TextFormField(
            controller: controller.quantity,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'^0')),
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              LengthLimitingTextInputFormatter(6),
            ],
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(AppConstants.val_0),
              border: const OutlineInputBorder(
                gapPadding: AppConstants.val_0,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: AppBorderRadius.borderRadius_16,
                gapPadding: AppConstants.val_0,
                borderSide: BorderSide(color: itemColor, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: AppBorderRadius.borderRadius_16,
                gapPadding: AppConstants.val_0,
                borderSide: BorderSide(color: itemColor, width: 1.5),
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: AppConstants.val_15),
        ValueDisplay(
          itemColor: itemColor,
          medicationModel: medicationModel,
        ),
      ],
    );
  }
}
