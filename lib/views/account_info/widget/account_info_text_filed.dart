import 'package:bio_medika/controllers/account_info_controller.dart';
import 'package:bio_medika/core/constant/app_assets_svg.dart';
import 'package:bio_medika/core/constant/app_border_radius.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/utils/validation.dart';
import 'package:bio_medika/views/auth/widget/custom_text_form_field_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldsAccountInformation extends StatelessWidget {
  const TextFieldsAccountInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: GetBuilder<AccountInformationControllerImp>(
        builder: (controller) => Form(
          key: controller.formState,
          child: Column(
            children: [
              CustomTextFieldWithIcon(
                imagePath: AppAssetsSvg.fullName,
                controllerText: controller.name,
                hintText: AppTextsEnglish.Name.tr,
                iconColor: AppColor.iconAndTextGrey,
                keyboardType: TextInputType.name,
                focusNode: controller.nameFocusNode,
                validator: (value) => Validation.length(value),
                readOnly: controller.readOnly,
              ),
              const SizedBox(height: 8),
              CustomTextFieldWithIcon(
                imagePath: AppAssetsSvg.pharmacy,
                controllerText: controller.pharmacyName,
                hintText: AppTextsEnglish.Pharmacy_Name.tr,
                iconColor: AppColor.iconAndTextGrey,
                keyboardType: TextInputType.name,
                focusNode: controller.pharmacyNameFocusNode,
                validator: (value) => Validation.length(value),
                readOnly: controller.readOnly,
              ),
              const SizedBox(height: 8),
              CustomTextFieldWithIcon(
                imagePath: AppAssetsSvg.email,
                controllerText: controller.email,
                hintText: AppTextsEnglish.Email.tr,
                iconColor: AppColor.iconAndTextGrey,
                keyboardType: TextInputType.emailAddress,
                focusNode: controller.emailFocusNode,
                validator: (value) => null,
                readOnly: true,
              ),
              const SizedBox(height: 8),
              CustomTextFieldWithIcon(
                imagePath: AppAssetsSvg.phone,
                controllerText: controller.phone,
                hintText: AppTextsEnglish.Phone_Number.tr,
                iconColor: AppColor.iconAndTextGrey,
                keyboardType: TextInputType.phone,
                focusNode: controller.phoneFocusNode,
                validator: (value) => Validation.isPhoneNumberValid(value),
                readOnly: controller.readOnly,
              ),
              const SizedBox(height: 8),
              CustomTextFieldWithIcon(
                imagePath: AppAssetsSvg.city,
                controllerText: controller.city,
                hintText: AppTextsEnglish.City.tr,
                iconColor: AppColor.iconAndTextGrey,
                keyboardType: TextInputType.name,
                focusNode: controller.cityFocusNode,
                validator: (value) => Validation.length(value),
                readOnly: controller.readOnly,
              ),
              const SizedBox(height: 8),
              CustomTextFieldWithIcon(
                imagePath: AppAssetsSvg.street,
                controllerText: controller.street,
                hintText: AppTextsEnglish.Street_Address.tr,
                iconColor: AppColor.iconAndTextGrey,
                keyboardType: TextInputType.streetAddress,
                focusNode: controller.streetFocusNode,
                validator: (value) => Validation.length(value),
                readOnly: controller.readOnly,
              ),
              const SizedBox(height: 8),
              CustomTextFieldWithIcon(
                imagePath: AppAssetsSvg.landmark,
                controllerText: controller.landmark,
                hintText: AppTextsEnglish.Landmark.tr,
                iconColor: AppColor.iconAndTextGrey,
                keyboardType: TextInputType.name,
                focusNode: controller.landmarkFocusNode,
                validator: (value) => Validation.length(value),
                readOnly: controller.readOnly,
              ),
              const SizedBox(height: 8),
              CustomTextFieldWithIcon(
                imagePath: AppAssetsSvg.district,
                controllerText: controller.district,
                hintText: AppTextsEnglish.District.tr,
                iconColor: AppColor.iconAndTextGrey,
                keyboardType: TextInputType.name,
                focusNode: controller.districtFocusNode,
                validator: (value) => Validation.length(value),
                readOnly: controller.readOnly,
              ),
              const SizedBox(height: 8),
              ExpansionTile(
                title: Text(AppTextsEnglish.Change_Password.tr),
                initiallyExpanded: false,
                shape: const RoundedRectangleBorder(
                  borderRadius: AppBorderRadius.borderRadius_20,
                ),
                children: [
                  CustomTextFieldWithIcon(
                    imagePath: AppAssetsSvg.lock,
                    controllerText: controller.oldPassword,
                    hintText: AppTextsEnglish.Password.tr,
                    iconColor: AppColor.iconAndTextGrey,
                    keyboardType: TextInputType.visiblePassword,
                    focusNode: controller.oldPasswordFocusNode,
                    validator: (value) => Validation.length(value, min: 8),
                    readOnly: controller.readOnly,
                  ),
                  const SizedBox(height: 8),
                  CustomTextFieldWithIcon(
                    imagePath: AppAssetsSvg.lock,
                    controllerText: controller.newPassword,
                    hintText: AppTextsEnglish.New_Password.tr,
                    iconColor: AppColor.iconAndTextGrey,
                    keyboardType: TextInputType.visiblePassword,
                    focusNode: controller.newPasswordFocusNode,
                    validator: (value) =>
                        Validation.checkPasswordStrength(value),
                    readOnly: controller.readOnly,
                  ),
                  const SizedBox(height: 8),
                  CustomTextFieldWithIcon(
                    imagePath: AppAssetsSvg.lock,
                    controllerText: controller.confirmPassword,
                    hintText: AppTextsEnglish.Confirm_New_Password.tr,
                    iconColor: AppColor.iconAndTextGrey,
                    keyboardType: TextInputType.visiblePassword,
                    focusNode: controller.confirmPasswordFocusNode,
                    validator: (value) => Validation.checkPasswordMatch(
                        value, controller.newPassword.text),
                    readOnly: controller.readOnly,
                  ),
                ], // Set dividerColor to transparent
              )
            ],
          ),
        ),
      ),
    );
  }
}
