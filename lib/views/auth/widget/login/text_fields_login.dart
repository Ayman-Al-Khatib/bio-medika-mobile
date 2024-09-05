import 'package:bio_medika/core/constant/app_assets_svg.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/controllers/auth/login_controller.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/utils/validation.dart';
import 'package:bio_medika/views/auth/widget/custom_text_form_field_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldsLogin extends StatelessWidget {
  const TextFieldsLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginControllerImp>(
        builder: (controller) => Column(
              children: [
                CustomTextFieldWithIcon(
                  imagePath: AppAssetsSvg.email,
                  controllerText: controller.email,
                  hintText: AppTextsEnglish.Email.tr,
                  iconColor: AppColor.iconAndTextGrey,
                  keyboardType: TextInputType.emailAddress,
                  focusNode: controller.focusNodePhone,
                  isObscureText: controller.isObscureText,
                  onPressed: controller.changeIsObscureText,
                  validator: (value) => Validation.validateEmail(value),
                  readOnly: controller.statusRequest == StatusRequest.loading,
                ),
                const SizedBox(height: 8),
                CustomTextFieldWithIcon(
                  alwaysVisble: false,
                  imagePath: AppAssetsSvg.lock,
                  controllerText: controller.password,
                  hintText: AppTextsEnglish.Password.tr,
                  iconColor: AppColor.iconAndTextGrey,
                  suffixIcon: true,
                  focusNode: controller.focusNodePassword,
                  isObscureText: controller.isObscureText,
                  keyboardType: TextInputType.visiblePassword,
                  onPressed: controller.changeIsObscureText,
                  readOnly: controller.statusRequest == StatusRequest.loading,
                  validator: (value) =>
                      Validation.checkPasswordStrength(value, isLogin: true),
                ),
              ],
            ));
  }
}
