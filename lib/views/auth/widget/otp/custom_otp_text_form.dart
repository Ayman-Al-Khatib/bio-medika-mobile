import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bio_medika/core/constant/app_border_radius.dart';

class CustomOtpTextField extends StatelessWidget {
  const CustomOtpTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.size,
    required this.isLast,
    required this.onVerifyCode,
    this.readOnly = false,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final double size;
  final bool isLast;
  final void Function() onVerifyCode;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: TextFormField(
        onChanged: (value) {
          if (controller.text.length == AppConstants.val_1 && !isLast) {
            focusNode.nextFocus();
          } else {
            onVerifyCode();
          }
        },
        controller: controller,
        focusNode: focusNode,
        readOnly: readOnly,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColor.black,
          fontSize: AppConstants.val_18,
          fontWeight: FontWeight.w600,
          shadows: [
            Shadow(
              color: AppColor.black,
              blurRadius: AppConstants.val_8,
              offset: Offset(AppConstants.val_0, AppConstants.val_2),
            )
          ],
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(
              left: AppConstants.val_2, bottom: AppConstants.val_1),
          filled: true,
          fillColor: AppColor.textFormFill,
          border: OutlineInputBorder(
            gapPadding: AppConstants.val_10,
            borderRadius: AppBorderRadius.borderRadius_16,
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppBorderRadius.borderRadius_16,
            borderSide:
                BorderSide(color: AppColor.primary, width: AppConstants.val_2),
          ),
        ),
      ),
    );
  }
}
