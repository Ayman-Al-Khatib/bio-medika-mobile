import 'dart:io';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<AwesomeDialog> showExitConfirmationDialog(bool value) async {
  return AwesomeDialog(
    context: Get.overlayContext!,
    dialogType: DialogType.noHeader,
    animType: AnimType.bottomSlide,
    title: AppTextsEnglish.Exit_Confirmation.tr, // Change the title
    desc: AppTextsEnglish.Are_you_sure_you_want_to_exit_the_application.tr,
    titleTextStyle: const TextStyle(
      fontSize: AppConstants.val_20,
      fontWeight: FontWeight.bold,
    ),
    descTextStyle: const TextStyle(
      fontSize: AppConstants.val_14,
    ),
    alignment: Alignment.bottomCenter,
    btnCancelOnPress: () {},
    btnOkOnPress: () {
      exit(0);
    },
    btnCancelText: AppTextsEnglish.Cancel.tr,
    btnCancelColor: AppColor.primary,
    btnOkText: AppTextsEnglish.Exit.tr,
    btnOkColor: AppColor.primary,
  )..show();
}
