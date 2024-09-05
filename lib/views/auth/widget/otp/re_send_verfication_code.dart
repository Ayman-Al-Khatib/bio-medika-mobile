import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/utils/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReSendButton extends StatelessWidget {
  const ReSendButton(
      {super.key, this.loading = false, required this.onPressed});
  final bool loading;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return loading
        ? const SizedBox(
            height: AppConstants.val_50,
            child: LoadingAnimation(
              height: AppConstants.val_40,
            ),
          )
        : reSendButton(onPressed);
  }

  SizedBox reSendButton(void Function()? onPressed) {
    return SizedBox(
      height: AppConstants.val_50,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          AppTextsEnglish.Resend_Code.tr,
          style: const TextStyle(
            fontSize: AppConstants.val_16,
            fontWeight: FontWeight.w600,
            color: AppColor.primary,
          ),
        ),
      ),
    );
  }
}
