import 'package:bio_medika/core/constant/app_assets_svg.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_fonts.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:bio_medika/core/utils/show_image_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomTextFieldWithIcon extends StatelessWidget {
  const CustomTextFieldWithIcon({
    super.key,
    required this.imagePath,
    this.iconColor,
    this.keyboardType,
    this.iconWidth,
    required this.focusNode,
    this.iconHeight,
    required this.controllerText,
    this.validator,
    required this.hintText,
    this.alwaysVisble = true,
    this.suffixIcon = false,
    this.isObscureText = false,
    this.onPressed,
    required this.readOnly,
  });
  final bool readOnly;
  final String imagePath;
  final Color? iconColor;
  final double? iconWidth;
  final double? iconHeight;
  final FocusNode focusNode;
  final TextEditingController controllerText;
  final String? Function(String?)? validator;
  final String hintText;
  final bool suffixIcon;
  final bool alwaysVisble;
  final TextInputType? keyboardType;
  final bool isObscureText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    MyAppServices myAppServices = Get.find();
    TextStyle? hintStyle() {
      return TextStyle(
          fontSize: AppConstants.val_14,
          color: AppColor.iconAndTextGrey,
          fontFamily: myAppServices.appIsArabic()
              ? AppFonts.cairo
              : AppFonts.montserrat);
    }

    TextStyle? style() {
      return TextStyle(
          fontWeight: FontWeight.w500,
          fontFamily: TextInputType.emailAddress == keyboardType || suffixIcon
              ? AppFonts.montserrat
              : myAppServices.appIsArabic()
                  ? AppFonts.cairo
                  : AppFonts.montserrat);
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: AppConstants.val_16),
          child: ShowImageSvg(
            path: !suffixIcon
                ? imagePath
                : isObscureText
                    ? AppAssetsSvg.lockClosed
                    : imagePath,
            color: !focusNode.hasFocus
                ? AppColor.iconAndTextGrey
                : AppColor.primary,
            width: iconWidth ?? AppConstants.val_22,
            height: iconHeight ?? AppConstants.val_22,
          ),
        ),
        const SizedBox(width: AppConstants.val_6),
        Expanded(
          child: TextFormField(
            inputFormatters: TextInputType.phone == keyboardType
                ? [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(
                        AppConstants.val_10.toInt()),
                  ]
                : null,
            style: style(),
            readOnly: readOnly,
            enableInteractiveSelection: !readOnly,
            keyboardType: keyboardType,
            focusNode: focusNode,
            validator: validator,
            cursorColor: AppColor.primary,
            obscureText: isObscureText && !alwaysVisble,
            controller: controllerText,
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.primary)),
              hintText: hintText,
              hintStyle: hintStyle(),
              suffixIcon: Visibility(
                visible: suffixIcon,
                child: IconButton(
                  splashRadius: AppConstants.val_8,
                  onPressed: onPressed,
                  icon: Icon(
                    size: AppConstants.val_20,
                    !isObscureText
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: !focusNode.hasFocus
                        ? AppColor.iconAndTextGrey
                        : AppColor.primary,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
