import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/controllers/auth/login_controller.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordButton extends GetView<LoginControllerImp> {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    MyAppServices myAppServices = Get.find();
    return Align(
      alignment: myAppServices.appIsArabic()
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: InkWell(
        onTap: () {
          controller.goToForgetPassword();
        },
        child: Text(
          AppTextsEnglish.Forget_Password.tr,
          style: const TextStyle(
            color: AppColor.primary,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
