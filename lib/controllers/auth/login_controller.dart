import 'dart:developer';

import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_route.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/data/auth/login_data.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/navigation/app_routes.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:bio_medika/core/ui/components/custom_awesom_dialog.dart';
import 'package:bio_medika/core/ui/shared/snacbar_widget.dart';
import 'package:bio_medika/models/response_data.dart';
import 'package:bio_medika/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  validation();
  changeIsObscureText();
  goToMainScreen();
  goToSingUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  late FocusNode focusNodePhone;
  late FocusNode focusNodePassword;
  LoginData loginData = LoginData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isObscureText = true;
  StatusRequest statusRequest = StatusRequest.none;
  MyAppServices myAppServices = Get.find();

  @override
  validation() {
    if (formState.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void changeIsObscureText() {
    isObscureText = isObscureText ? false : true;
    update();
  }

  @override
  goToMainScreen() async {
    if (validation()) {
      statusRequest = StatusRequest.loading;
      update();
      Map<String, String> data = {"email": email.text, "password": password.text};
      ResponseData response = await loginData.postData(data);

      statusRequest = response.statusRequest;

      if (response.statusRequest == StatusRequest.success) {
        await UserModel.fromJson(response.data).save();
        myAppServices.putValue(AppTextsEnglish.position, AppRoutes.mainScreen);
        NavigationService.mainScreen();
      } else {
        if (response.errors ==
            AppTextsEnglish.User_Must_Verify_His_Account_Before_Logging_In) {
          customAwesomDialog(
            title: AppTextsEnglish.The_account_is_not_confirmed.tr,
            dis: AppTextsEnglish
                .Your_email_has_received_a_verification_code_Press_OK_to_proceed.tr,
            email: email.text,
          );
        } else {
          String error;
          if (response.errors == AppTextsEnglish.E_mail_or_password_is_incorrect) {
            error = AppTextsEnglish.E_mail_or_password_is_incorrect.tr;
          } else {
            error = response.errors;
          }
          await showCustomSnackbar(
            title: AppTextsEnglish.Error.tr,
            message: error,
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
  }

  @override
  goToSingUp() {
    NavigationService.signUp();
  }

  @override
  goToForgetPassword() {
    NavigationService.forgetPassword();
  }

  @override
  void onInit() {
    //! await 😁
    // FirebaseMessaging.instance.getToken().then((value) {
    //   print("loginControllerImp => onInit =>send notifications =>  $value");
    //   // ignore: unused_local_variable
    //   String? token = value;
    // });
    //!

    email = TextEditingController();
    password = TextEditingController();
    focusNodePhone = FocusNode();
    focusNodePassword = FocusNode();

    focusNodePhone.addListener(() => update());
    focusNodePassword.addListener(() => update());

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    focusNodePhone.dispose();
    focusNodePassword.dispose();
    super.dispose();
  }
}
