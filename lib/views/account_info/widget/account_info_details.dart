import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bio_medika/controllers/account_info_controller.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/views/account_info/widget/account_info_text_filed.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountInformationDetails extends StatelessWidget {
  const AccountInformationDetails({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        top: size.width * 0.35 +
            size.height * 0.05 +
            AppConstants.val_45 +
            AppConstants.val_14 +
            AppConstants.val_50,
      ),
      child: Container(
        padding: const EdgeInsets.only(
          top: AppConstants.val_18,
          left: AppConstants.val_20,
          right: AppConstants.val_20,
        ),
        width: double.infinity,
        height: size.height,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(AppConstants.val_40)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TextFieldsAccountInformation(),
              const SizedBox(height: 30),
              GetBuilder<AccountInformationControllerImp>(builder: (controller) {
                return AnimatedButton(
                  width: 250,
                  color: AppColor.secondary,
                  pressEvent: controller.actionButton,
                  text: controller.readOnly ? AppTextsEnglish.Unlock.tr : AppTextsEnglish.Update.tr,
                );
              }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
