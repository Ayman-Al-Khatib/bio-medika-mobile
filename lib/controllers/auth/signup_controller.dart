import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/data/auth/signup_data.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/navigation/app_routes.dart';
import 'package:bio_medika/core/ui/shared/snacbar_widget.dart';
import 'package:bio_medika/models/response_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  changeIsObscureTextPassword();
  changeIsObscureTextConfirmPassword();
  validation();
  goToLogin();
  goToVerifyCode();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController fullNmame;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  late TextEditingController pharmacyName;

  late FocusNode focusNodeFullName;
  late FocusNode focusNodeEmail;
  late FocusNode focusNodePhone;
  late FocusNode focusNodePassword;
  late FocusNode focusNodeConfirmPassword;
  late FocusNode focusNodePharmacyName;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isObscureTextPassword = false;
  bool isObscureTextConfirmPassword = false;
  StatusRequest statusRequest = StatusRequest.none;

  SingupData signupData = SingupData(Get.find());

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
  goToLogin() {
    NavigationService.login();
  }

  @override
  goToVerifyCode() async {
    Map<String, String> data = {
      "email": email.text,
      "password": password.text,
      "name": fullNmame.text,
      "phone_number": phone.text,
      "pharmacy_name": pharmacyName.text,
    };
    if (validation()) {
      statusRequest = StatusRequest.loading;
      update();
      ResponseData response = await signupData.postData(data);

      if (response.statusRequest == StatusRequest.success) {
        showCustomSnackbar(
          title: AppTextsEnglish.Account_Creation_Successful.tr,
          message: AppTextsEnglish
              .Verification_code_sent_to_your_email_Please_enter_to_confirm.tr,
          backgroundColor: AppColor.primary,
          textColor: Colors.white,
          borderRadius: AppConstants.val_10,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          duration: const Duration(seconds: 3),
          backgroundGradient: const LinearGradient(
              colors: [AppColor.secondary, AppColor.primary]),
        );
        await Future.delayed(const Duration(milliseconds: 3000));
        statusRequest = StatusRequest.success;
        NavigationService.otp(argument: {AppTextsEnglish.email: email.text});
      } else {
        String error, title;
        if (response.statusRequest == StatusRequest.serverFailure) {
          error = AppTextsEnglish
              .The_account_has_already_been_created_Please_go_to_the_login_page
              .tr;
          title = AppTextsEnglish.Account_exists.tr;
        } else {
          if (response.statusRequest == StatusRequest.offline) {
            title = AppTextsEnglish.Offline.tr;
          } else {
            title = AppTextsEnglish.Error.tr;
          }
          error = response.errors;
        }

        await showCustomSnackbar(
          title: title,
          message: error,
          backgroundColor: Colors.redAccent,
          backgroundGradient: const LinearGradient(
            colors: [Colors.redAccent, Colors.pinkAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: AppConstants.val_15,
          duration: const Duration(milliseconds: 1800),
        );
        statusRequest = response.statusRequest;
      }
    }
    update();
  }

  @override
  void onInit() {
    fullNmame = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    pharmacyName = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();

    focusNodePhone = FocusNode();
    focusNodeEmail = FocusNode();
    focusNodePassword = FocusNode();
    focusNodePharmacyName = FocusNode();
    focusNodeFullName = FocusNode();
    focusNodeConfirmPassword = FocusNode();

    focusNodePhone.addListener(() => update());
    focusNodePassword.addListener(() => update());
    focusNodePharmacyName.addListener(() => update());
    focusNodeFullName.addListener(() => update());
    focusNodeConfirmPassword.addListener(() => update());
    focusNodeEmail.addListener(() => update());

    super.onInit();
  }

  @override
  void dispose() {
    phone.dispose();
    password.dispose();
    fullNmame.dispose();
    phone.dispose();
    email.dispose();

    focusNodePhone.dispose();
    focusNodePassword.dispose();
    focusNodeFullName.dispose();
    focusNodePhone.dispose();
    focusNodeEmail.dispose();

    super.dispose();
  }
}
