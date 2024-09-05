import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bio_medika/controllers/tiny_tasks/up_price_awesom_controller.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/ui/shared/button_add_to_cart_awesom/awesome_body.dart';
import 'package:bio_medika/models/medication_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AwesomeDialog customAwesomeDialogAddToCart({
  required (Color, Color, String) infoDes,
  required MedicationModel medicationModel,
}) {
  AwesomeControllerImp controller = Get.put(AwesomeControllerImp());
  return AwesomeDialog(
    context: Get.context!,
    animType: AnimType.scale,
    dialogType: DialogType.noHeader,
    bodyHeaderDistance: AppConstants.val_10,
    btnOkOnPress: () async {
      await controller.addToCart(medicationModel);
    },
    btnCancelOnPress: () {},
    body: AwesomeBody(
        backgroundColor: infoDes.$1,
        itemColor: infoDes.$2,
        medicationModel: medicationModel),
    btnCancelText: AppTextsEnglish.Cancel.tr,
    btnOkText: AppTextsEnglish.Ok.tr,
    dialogBackgroundColor: infoDes.$1,
    btnCancelColor: infoDes.$2,
    btnOkColor: infoDes.$2,
    onDismissCallback: (value) async {
      await Future.delayed(const Duration(seconds: 1));
      controller.quantity.text = '1';
    },
    padding: EdgeInsets.zero,
  )..show();
}
