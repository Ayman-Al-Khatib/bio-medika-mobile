import 'package:bio_medika/core/constant/app_assets_png.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/controllers/auth/reset_password_controller.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/views/auth/widget/custom_button_auth.dart';
import 'package:bio_medika/views/auth/widget/custom_image_auth.dart';
import 'package:bio_medika/views/auth/widget/reset_password/text_field_reset_password.dart';
import 'package:bio_medika/views/auth/widget/title_page_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordBody extends GetView<ResetPasswordControllerImp> {
  const ResetPasswordBody({
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
            SizedBox(height: size.height * 0.18),
            const CustonImageAuth(imagePath: AppAssetsPng.resetPassowrd),
            SizedBox(height: size.height * 0.06),
            TitlePageAuth(
              title: AppTextsEnglish.Reset_Line_Password.tr,
              textSize: AppConstants.val_30,
            ),
            const SizedBox(
              height: AppConstants.val_20,
            ),
            const TextFieldsResetPassword(),
            const SizedBox(
              height: AppConstants.val_35,
            ),
            GetBuilder<ResetPasswordControllerImp>(builder: (controller) {
              return CustomButtonAuth(
                text: AppTextsEnglish.Reset_password.tr,
                onTap: controller.goToLogin,
                loading: controller.statusRequest == StatusRequest.loading,
              );
            }),
          ],
        ),
      ),
    );
  }
}
