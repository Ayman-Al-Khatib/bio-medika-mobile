import 'package:bio_medika/core/constant/app_assets_png.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/controllers/auth/login_controller.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/views/auth/widget/custom_button_auth.dart';
import 'package:bio_medika/views/auth/widget/custom_image_auth.dart';
import 'package:bio_medika/views/auth/widget/login/text_fields_login.dart';
import 'package:bio_medika/views/auth/widget/switch_between_login_signup.dart';
import 'package:bio_medika/views/auth/widget/title_page_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'customm_button_forget_password.dart';

class LoginBody extends GetView<LoginControllerImp> {
  const LoginBody({
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
            SizedBox(height: size.height * 0.15),
            const CustonImageAuth(imagePath: AppAssetsPng.login),
            const SizedBox(height: 20),
            TitlePageAuth(title: AppTextsEnglish.Login.tr),
            const SizedBox(height: 20),
            const TextFieldsLogin(),
            const SizedBox(height: 6),
            const ForgetPasswordButton(),
            const SizedBox(height: 30),
            GetBuilder<LoginControllerImp>(builder: (controller) {
              return CustomButtonAuth(
                text: AppTextsEnglish.Login.tr,
                onTap: controller.goToMainScreen,
                loading: controller.statusRequest == StatusRequest.loading,
              );
            }),
            const SizedBox(height: 20),
            SwitchBetweenLoginSignup(
              explan: AppTextsEnglish.Don_t_have_an_account.tr,
              nameNewPage: AppTextsEnglish.s_Sign_Up.tr,
              onTap: controller.goToSingUp,
            ),
            const SizedBox(height: AppConstants.val_8),
          ],
        ),
      ),
    );
  }
}
