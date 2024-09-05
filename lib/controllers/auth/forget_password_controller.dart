import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/data/auth/forget_password_data.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/navigation/app_routes.dart';
import 'package:bio_medika/core/ui/shared/snacbar_widget.dart';
import 'package:bio_medika/models/response_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  validation();
  goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;
  late FocusNode focusNodeEmail;
  late GlobalKey<FormState> formState;
  late StatusRequest statusRequest;
  late ForgetPasswordData forgetPasswordData;

  @override
  void onInit() {
    email = TextEditingController();
    focusNodeEmail = FocusNode();
    formState = GlobalKey<FormState>();
    forgetPasswordData = ForgetPasswordData(Get.find());
    statusRequest = StatusRequest.none;
    focusNodeEmail.addListener(() {
      update();
    });

    super.onInit();
  }

  @override
  validation() {
    if (formState.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  goToVerifyCode() async {
    if (validation()) {
      statusRequest = StatusRequest.loading;
      update();
      ResponseData response =
          await forgetPasswordData.sendCode(email: email.text);
      statusRequest = response.statusRequest;

      if (response.statusRequest == StatusRequest.success) {
        NavigationService.otp(argument: {AppTextsEnglish.email: email.text});
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
  }

  @override
  void dispose() {
    email.dispose();
    focusNodeEmail.dispose();
    super.dispose();
  }
}
