import 'package:bio_medika/core/constant/app_assets_png.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/controllers/auth/otp_controller.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/views/auth/widget/otp/custom_otp_text_form.dart';
import 'package:bio_medika/views/auth/widget/otp/re_send_verfication_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_constant.dart';

class OtpBody extends GetView<OtpControllerImp> {
  const OtpBody({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        padding: EdgeInsets.symmetric(
            horizontal: size.width * AppConstants.horizontalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(AppAssetsPng.otp),
            const SizedBox(height: AppConstants.val_8),
            Text(
              AppTextsEnglish.Verification.tr,
              style: const TextStyle(
                fontSize: AppConstants.val_20,
                fontWeight: FontWeight.w600,
                color: AppColor.black,
              ),
            ),
            const SizedBox(height: AppConstants.val_8),
            RichText(
              text: TextSpan(
                text: AppTextsEnglish.Enter_your_code_number.tr,
                style: const TextStyle(
                  fontSize: AppConstants.val_14,
                  fontWeight: FontWeight.w500,
                  color: AppColor.black,
                ),
                children: [
                  TextSpan(
                    text: controller.email,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColor.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppConstants.val_30),
            Directionality(
              textDirection: TextDirection.ltr,
              child: RawKeyboardListener(
                focusNode: controller.parentFoucs,
                onKey: (RawKeyEvent event) {
                  if (event is RawKeyDownEvent &&
                      event.logicalKey == LogicalKeyboardKey.backspace) {
                    controller.parentFoucs.previousFocus();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    6,
                    (index) => GetBuilder<OtpControllerImp>(
                      builder: (controller) => CustomOtpTextField(
                        controller: controller.controllers[index],
                        focusNode: controller.focusNodes[index],
                        size: size.width * 0.12,
                        isLast: index == AppConstants.val_5,
                        onVerifyCode: controller.checkVerifyCodeIsCorrect,
                        readOnly:
                            controller.statusRequest == StatusRequest.loading,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GetBuilder<OtpControllerImp>(builder: (controller) {
              return ReSendButton(
                loading: controller.statusRequest == StatusRequest.loading,
                onPressed: controller.reSendVerfiyCode,
              );
            }),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
