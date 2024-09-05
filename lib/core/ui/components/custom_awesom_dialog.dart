import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customAwesomDialog(
    {required String title, required String dis, required String email}) async {
  await AwesomeDialog(
    padding: const EdgeInsets.symmetric(horizontal: AppConstants.val_14),
    context: Get.context!,
    dialogType: DialogType.warning,
    animType: AnimType.bottomSlide,
    title: title,
    desc: dis,
    titleTextStyle: const TextStyle(
      fontSize: AppConstants.val_17,
      fontWeight: FontWeight.w600,
    ),
    btnCancelText: AppTextsEnglish.cancel.tr,
    btnOkText: AppTextsEnglish.Ok.tr,
    descTextStyle: const TextStyle(
      fontSize: AppConstants.val_14,
      fontWeight: FontWeight.w500,
    ),
    btnCancelOnPress: () {},
    btnOkOnPress: () async {
      NavigationService.otp(argument: {"email": email});
    },
  ).show();
}
