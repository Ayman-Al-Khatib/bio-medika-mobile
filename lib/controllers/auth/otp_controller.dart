import 'dart:async';

import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_route.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/data/auth/forget_password_data.dart';
import 'package:bio_medika/core/data/auth/otp_data.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/navigation/app_routes.dart';
import 'package:bio_medika/core/ui/shared/show_success_dialog.dart';
import 'package:bio_medika/core/ui/shared/snacbar_widget.dart';
import 'package:bio_medika/models/response_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OtpController extends GetxController {
  void checkVerifyCodeIsCorrect();
  void reSendVerfiyCode();
}

class OtpControllerImp extends OtpController {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes = [];
  late FocusNode parentFoucs;
  late String email;
  late StatusRequest statusRequest;
  late ForgetPasswordData forgetPasswordData;
  late OtpData otpData;
  @override
  Future<void> checkVerifyCodeIsCorrect() async {
    String code = '';
    for (int i = 0; i < 6; i++) {
      code += controllers[i].text;
    }
    if (code.length == 6) {
      statusRequest = StatusRequest.loading;
      update();

      for (int i = 0; i < 6; i++) {
        controllers[i].clear();
      }
      focusNodes[5].unfocus();
      ResponseData response = await otpData.checkCode(email: email, code: code);

      statusRequest = response.statusRequest;
      if (response.statusRequest == StatusRequest.success) {
        if (Get.routing.previous == AppRoutes.forgetPassword ||
            Get.routing.previous == AppRoutes.resetPassword) {
          NavigationService.resetPassword(
              argument: {'email': email, "code": code});
        } else {
          showSuccessDialog(Get.context!, () {
            NavigationService.login();
          });
        }
      } else {
        String body;
        if (response.statusRequest == StatusRequest.offline) {
          body = AppTextsEnglish.Offline.tr;
        } else if (response.errors ==
            AppTextsEnglish.An_unexpected_error_occurred_Try_again_later) {
          body =
              AppTextsEnglish.An_unexpected_error_occurred_Try_again_later.tr;
        } else {
          body = AppTextsEnglish.Invalid_code_Please_try_again.tr;
        }

        await showCustomSnackbar(
          title: AppTextsEnglish.Error.tr,
          message: body,
          backgroundColor: Colors.redAccent,
          backgroundGradient: const LinearGradient(
            colors: [Colors.redAccent, Colors.pinkAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: AppConstants.val_15,
          duration: const Duration(seconds: 3),
        );
      }

      update();
    }
  }

  @override
  reSendVerfiyCode() async {
    statusRequest = StatusRequest.loading;
    update();

    ResponseData response = await forgetPasswordData.sendCode(email: email);
    statusRequest = response.statusRequest;
    if (response.statusRequest == StatusRequest.success) {
      await showCustomSnackbar(
        title: AppTextsEnglish.Success.tr,
        message:
            AppTextsEnglish.Confirmation_code_has_been_sent_successfully.tr,
        backgroundColor: AppColor.primary,
        textColor: Colors.white,
        borderRadius: AppConstants.val_10,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        duration: const Duration(seconds: 3),
        backgroundGradient: const LinearGradient(
            colors: [AppColor.secondary, AppColor.primary]),
      );
    } else {
      String body;
      if (response.statusRequest == StatusRequest.offline) {
        body = AppTextsEnglish.Offline.tr;
      } else {
        body = AppTextsEnglish
            .The_provided_account_information_does_not_match_any_existing_records
            .tr;
      }
      await showCustomSnackbar(
        title: AppTextsEnglish.Error.tr,
        message: body,
        backgroundColor: Colors.redAccent,
        backgroundGradient: const LinearGradient(
          colors: [Colors.redAccent, Colors.pinkAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: AppConstants.val_15,
        duration: const Duration(milliseconds: 2500),
      );
    }

    update();
  }

  @override
  void onInit() {
    controllers = List.generate(6, (index) => TextEditingController());
    focusNodes = List.generate(6, (index) => FocusNode());
    for (int i = 0; i < 6; i++) {
      focusNodes[i].addListener(() {
        update();
      });
    }
    forgetPasswordData = ForgetPasswordData(Get.find());
    statusRequest = StatusRequest.none;
    otpData = OtpData(Get.find());
    parentFoucs = FocusNode();
    Map<String, dynamic> arguments = Get.arguments ?? {};
    email = arguments['email'] ?? '';
    super.onInit();
  }

  @override
  void onClose() {
    for (int i = 0; i < 6; i++) {
      focusNodes[i].dispose();
      controllers[i].dispose();
    }
    parentFoucs.dispose();
    super.onClose();
  }
}
