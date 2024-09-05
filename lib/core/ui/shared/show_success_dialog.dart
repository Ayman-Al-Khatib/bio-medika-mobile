import 'package:bio_medika/core/constant/app_assets_lottie.dart';
import 'package:bio_medika/core/constant/app_border_radius.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/views/auth/widget/custom_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

void showSuccessDialog(BuildContext context, Function onTap) {
  final size = MediaQuery.of(context).size;
  showDialog(
    context: context,
    builder: (context) {
      return PopScope(
        canPop: false,
        child: AlertDialog(
          contentPadding: EdgeInsets.zero, // Set contentPadding to zero

          content: Container(
            decoration: const BoxDecoration(
              borderRadius: AppBorderRadius.borderRadius_20,
              color: AppColor.background,
            ),
            height: size.height * 0.5,
            child: Column(
              children: [
                const Spacer(flex: 2),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                  ),
                  child: Text(
                    AppTextsEnglish.Well_Done_Access_Approved.tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Lottie.asset(
                  AppAssetsLottie.approved,
                  height: size.height * 0.25,
                  repeat: false,
                ),
                const Spacer(flex: 3),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                    child: CustomButtonAuth(
                      onTap: onTap,
                      text: AppTextsEnglish.Login_Now.tr,
                    ),
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      );
    },
  );
}
