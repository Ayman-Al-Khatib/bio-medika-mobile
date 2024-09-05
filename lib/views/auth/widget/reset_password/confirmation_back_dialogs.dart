import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<AwesomeDialog> showConfirmationDialog(bool value) async {
  return AwesomeDialog(
    padding: const EdgeInsets.symmetric(horizontal: AppConstants.val_10),
    context: Get.overlayContext!,
    dialogType: DialogType.noHeader,
    animType: AnimType.bottomSlide,
    title: AppTextsEnglish.Do_you_want_to_undo.tr,
    desc: AppTextsEnglish.Go_to_the_login_page_or_click_Cancel_to_continue.tr,
    titleTextStyle: const TextStyle(
      fontSize: AppConstants.val_20,
      fontWeight: FontWeight.bold,
    ),
    descTextStyle: const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: AppConstants.val_16,
    ),
    btnCancelOnPress: () {},
    btnOkOnPress: () {
      NavigationService.login();
    },
    btnCancelText: AppTextsEnglish.Cancel.tr,
    btnCancelColor: AppColor.primary,
    btnOkText: AppTextsEnglish.login.tr,
    btnOkColor: AppColor.primary,
  )..show();
}
