import 'package:bio_medika/core/constant/app_assets_svg.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/controllers/auth/signup_controller.dart';
import 'package:bio_medika/controllers/auth/reset_password_controller.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/utils/validation.dart';
import 'package:bio_medika/views/auth/widget/custom_text_form_field_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_constant.dart';

class TextFieldsResetPassword extends GetView<SignUpControllerImp> {
  const TextFieldsResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordControllerImp>(
      builder: (controller) => Column(
        children: [
          CustomTextFieldWithIcon(
            imagePath: AppAssetsSvg.lock,
            controllerText: controller.newPassword,
            hintText: AppTextsEnglish.New_Password.tr,
            iconColor: AppColor.iconAndTextGrey,
            suffixIcon: true,
            focusNode: controller.focusNodeNewPassword,
            alwaysVisble: false,
            isObscureText: controller.isObscureTextPassword,
            onPressed: controller.changeIsObscureTextPassword,
            validator: (value) => Validation.checkPasswordStrength(value),
            readOnly: controller.statusRequest == StatusRequest.loading,
          ),
          const SizedBox(height: AppConstants.val_8),
          CustomTextFieldWithIcon(
            alwaysVisble: false,
            imagePath: AppAssetsSvg.lock,
            controllerText: controller.confirmNewPassword,
            hintText: AppTextsEnglish.Confirm_New_Password.tr,
            iconColor: AppColor.iconAndTextGrey,
            suffixIcon: true,
            focusNode: controller.focusNodeConfirmNewPassword,
            isObscureText: controller.isObscureTextConfirmPassword,
            onPressed: controller.changeIsObscureTextConfirmPassword,
            validator: (value) => Validation.checkPasswordMatch(
                value, controller.newPassword.text),
            readOnly: controller.statusRequest == StatusRequest.loading,
          ),
        ],
      ),
    );
  }
}
