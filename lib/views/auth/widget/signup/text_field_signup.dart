import 'package:bio_medika/core/constant/app_assets_svg.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/controllers/auth/signup_controller.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/utils/validation.dart';
import 'package:bio_medika/views/auth/widget/custom_text_form_field_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldsSignUp extends GetView<SignUpControllerImp> {
  const TextFieldsSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpControllerImp>(
      builder: (controller) => Column(
        children: [
          //* 1 =>  Name
          CustomTextFieldWithIcon(
            imagePath: AppAssetsSvg.fullName,
            controllerText: controller.fullNmame,
            hintText: AppTextsEnglish.Name.tr,
            iconColor: AppColor.iconAndTextGrey,
            focusNode: controller.focusNodeFullName,
            validator: (value) => Validation.length(value),
            readOnly: controller.statusRequest == StatusRequest.loading,
          ),

          const SizedBox(height: AppConstants.val_8),

          //* 2 => Pharmacy Name
          CustomTextFieldWithIcon(
            imagePath: AppAssetsSvg.pharmacy,
            controllerText: controller.pharmacyName,
            hintText: AppTextsEnglish.Pharmacy_Name.tr,
            iconColor: AppColor.iconAndTextGrey,
            focusNode: controller.focusNodePharmacyName,
            validator: (value) => Validation.length(value),
            readOnly: controller.statusRequest == StatusRequest.loading,
          ),

          const SizedBox(height: AppConstants.val_8),

          //* 3 => Phone Number
          CustomTextFieldWithIcon(
            imagePath: AppAssetsSvg.phone,
            controllerText: controller.phone,
            hintText: AppTextsEnglish.Phone_Number.tr,
            keyboardType: TextInputType.phone,
            iconColor: AppColor.iconAndTextGrey,
            focusNode: controller.focusNodePhone,
            validator: (value) => Validation.isPhoneNumberValid(value),
            readOnly: controller.statusRequest == StatusRequest.loading,
          ),

          const SizedBox(height: AppConstants.val_8),
          //* add in the last
          CustomTextFieldWithIcon(
            imagePath: AppAssetsSvg.email,
            controllerText: controller.email,
            hintText: AppTextsEnglish.Email.tr,
            iconColor: AppColor.iconAndTextGrey,
            keyboardType: TextInputType.emailAddress,
            focusNode: controller.focusNodeEmail,
            validator: (value) => Validation.validateEmail(value),
            readOnly: controller.statusRequest == StatusRequest.loading,
          ),
          const SizedBox(height: AppConstants.val_8),

          //* 4 => Password
          CustomTextFieldWithIcon(
            imagePath: AppAssetsSvg.lock,
            controllerText: controller.password,
            hintText: AppTextsEnglish.Password.tr,
            iconColor: AppColor.iconAndTextGrey,
            suffixIcon: true,
            focusNode: controller.focusNodePassword,
            alwaysVisble: false,
            isObscureText: controller.isObscureTextPassword,
            onPressed: controller.changeIsObscureTextPassword,
            validator: (value) => Validation.checkPasswordStrength(value),
            keyboardType: TextInputType.visiblePassword,
            readOnly: controller.statusRequest == StatusRequest.loading,
          ),

          const SizedBox(height: AppConstants.val_8),

          //* 5 => Confirm Password
          CustomTextFieldWithIcon(
            alwaysVisble: false,
            imagePath: AppAssetsSvg.lock,
            controllerText: controller.confirmPassword,
            hintText: AppTextsEnglish.Confirm_Password.tr,
            iconColor: AppColor.iconAndTextGrey,
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: true,
            focusNode: controller.focusNodeConfirmPassword,
            isObscureText: controller.isObscureTextConfirmPassword,
            onPressed: controller.changeIsObscureTextConfirmPassword,
            validator: (value) =>
                Validation.checkPasswordMatch(value, controller.password.text),
            readOnly: controller.statusRequest == StatusRequest.loading,
          ),
        ],
      ),
    );
  }
}
