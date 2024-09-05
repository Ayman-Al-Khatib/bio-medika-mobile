import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/data/auth/reset_password_data.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/navigation/app_routes.dart';
import 'package:bio_medika/core/ui/shared/show_success_dialog.dart';
import 'package:bio_medika/core/ui/shared/snacbar_widget.dart';
import 'package:bio_medika/models/response_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  bool validation();
  void goToLogin();
  void changeIsObscureTextConfirmPassword();
  void changeIsObscureTextPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController newPassword;
  late TextEditingController confirmNewPassword;
  late FocusNode focusNodeNewPassword;
  late FocusNode focusNodeConfirmNewPassword;
  late GlobalKey<FormState> formState;
  late bool isObscureTextPassword;
  late bool isObscureTextConfirmPassword;
  late StatusRequest statusRequest;
  late ResetPasswordData resetPasswordData;
  late String email;
  late String code;

  @override
  void changeIsObscureTextPassword() {
    isObscureTextPassword = !isObscureTextPassword;
    update();
  }

  @override
  void changeIsObscureTextConfirmPassword() {
    isObscureTextConfirmPassword = !isObscureTextConfirmPassword;
    update();
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
  goToLogin() async {
    if (validation()) {
      statusRequest = StatusRequest.loading;
      update();
      ResponseData response = await resetPasswordData.resetPassword(
          email: email, password: newPassword.text, code: code);
      statusRequest = response.statusRequest;

      if (response.statusRequest == StatusRequest.success) {
        showSuccessDialog(Get.context!, () {
          NavigationService.login();
        });
      } else {
        String body;
        if (response.statusRequest == StatusRequest.offline) {
          body = AppTextsEnglish.Offline.tr;
        } else {
          body = response.errors;
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
    }

    update();
  }

  @override
  void onInit() {
    newPassword = TextEditingController();
    confirmNewPassword = TextEditingController();
    focusNodeNewPassword = FocusNode();
    focusNodeConfirmNewPassword = FocusNode();
    isObscureTextPassword = false;
    isObscureTextConfirmPassword = false;
    formState = GlobalKey<FormState>();
    focusNodeNewPassword.addListener(() => update());
    focusNodeConfirmNewPassword.addListener(() => update());
    statusRequest = StatusRequest.none;
    Map<String, dynamic> arguments = Get.arguments ?? {};
    email = arguments['email'] ?? '';
    code = arguments['code'] ?? '';
    resetPasswordData = ResetPasswordData(Get.find());
    super.onInit();
  }

  @override
  void dispose() {
    newPassword.dispose();
    confirmNewPassword.dispose();

    focusNodeNewPassword.dispose();
    newPassword.dispose();
    super.dispose();
  }
}
