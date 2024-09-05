import 'package:bio_medika/core/constant/app_assets_png.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_assets_svg.dart';
import 'package:bio_medika/controllers/auth/forget_password_controller.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/utils/validation.dart';
import 'package:bio_medika/views/auth/widget/custom_button_auth.dart';
import 'package:bio_medika/views/auth/widget/custom_image_auth.dart';
import 'package:bio_medika/views/auth/widget/custom_text_form_field_auth.dart';
import 'package:bio_medika/views/auth/widget/title_page_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordBody extends GetView<ForgetPasswordControllerImp> {
  const ForgetPasswordBody({
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
            const CustonImageAuth(imagePath: AppAssetsPng.forgetPassword),
            SizedBox(height: size.height * 0.06),
            TitlePageAuth(
              title: AppTextsEnglish.Forget_Line_Password.tr,
              textSize: 30,
            ),
            SizedBox(height: size.height * 0.02),
            TitlePageAuth(
              title: AppTextsEnglish
                  .Don_t_worry_it_happens_Please_enter_the_address_associated_with_your_account
                  .tr,
              textSize: 14,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: size.height * 0.04),
            GetBuilder<ForgetPasswordControllerImp>(
                builder: (controller) => CustomTextFieldWithIcon(
                      validator: (value) => Validation.validateEmail(value),
                      readOnly:
                          controller.statusRequest == StatusRequest.loading,
                      imagePath: AppAssetsSvg.email,
                      keyboardType: TextInputType.emailAddress,
                      controllerText: controller.email,
                      hintText: AppTextsEnglish.Email.tr,
                      iconColor: AppColor.iconAndTextGrey,
                      focusNode: controller.focusNodeEmail,
                    )),
            SizedBox(height: size.height * 0.04),
            GetBuilder<ForgetPasswordControllerImp>(builder: (controller) {
              return CustomButtonAuth(
                text: AppTextsEnglish.Submit.tr,
                onTap: controller.goToVerifyCode,
                loading: controller.statusRequest == StatusRequest.loading,
              );
            }),
          ],
        ),
      ),
    );
  }
}
