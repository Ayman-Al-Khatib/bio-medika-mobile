import 'package:bio_medika/core/constant/app_assets_png.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/controllers/auth/signup_controller.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/views/auth/widget/custom_button_auth.dart';
import 'package:bio_medika/views/auth/widget/custom_image_auth.dart';
import 'package:bio_medika/views/auth/widget/signup/text_field_signup.dart';
import 'package:bio_medika/views/auth/widget/switch_between_login_signup.dart';
import 'package:bio_medika/views/auth/widget/title_page_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpBody extends GetView<SignUpControllerImp> {
  const SignUpBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      key: controller.formState,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * AppConstants.horizontalPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.07),
            CustonImageAuth(imagePath: AppAssetsPng.signup.tr),
            SizedBox(height: size.height * 0.03),
            TitlePageAuth(title: AppTextsEnglish.s_Sign_Up.tr),
            SizedBox(height: size.height * 0.01),
            const TextFieldsSignUp(),
            SizedBox(height: size.height * 0.05),
            GetBuilder<SignUpControllerImp>(builder: (controller) {
              return CustomButtonAuth(
                text: AppTextsEnglish.Sign_Up.tr,
                onTap: controller.goToVerifyCode,
                loading: controller.statusRequest == StatusRequest.loading,
              );
            }),
            SizedBox(height: size.height * 0.015),
            SwitchBetweenLoginSignup(
                explan: AppTextsEnglish.Joined_us_before.tr,
                nameNewPage: AppTextsEnglish.s_Login.tr,
                onTap: controller.goToLogin),
            const SizedBox(height: AppConstants.val_12),
          ],
        ),
      ),
    );
  }
}
