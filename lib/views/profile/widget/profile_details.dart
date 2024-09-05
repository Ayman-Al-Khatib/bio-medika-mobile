import 'package:bio_medika/controllers/profile/profile_action_controller.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';

import 'package:bio_medika/views/profile/widget/profile_option.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileDetails extends GetView<ProfileActionController> {
  const ProfileDetails({super.key});
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
        padding: const EdgeInsets.only(top: AppConstants.val_18),
        width: double.infinity,
        height: size.height,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppConstants.val_40)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileOption(
                title: AppTextsEnglish.Account_Information.tr,
                iconData: Icons.person,
                onTap: controller.accountInformaiton,
              ),
              const SizedBox(height: AppConstants.val_12),
              ProfileOption(
                title: AppTextsEnglish.My_Orders.tr,
                iconData: Icons.shopping_cart,
                onTap: controller.myOrder,
              ),
              const SizedBox(height: AppConstants.val_12),
              GetBuilder<ProfileActionController>(builder: (controller) {
                return ProfileOption(
                  title: AppTextsEnglish.Notifications.tr,
                  iconData: controller.notifications
                      ? Icons.notifications
                      : Icons.notifications_off,
                  onTap: controller.toggleNotification,
                );
              }),
              const SizedBox(height: AppConstants.val_12),
              ProfileOption(
                title: AppTextsEnglish.Favorite.tr,
                iconData: Icons.favorite,
                onTap: controller.favorite,
              ),
              const SizedBox(height: AppConstants.val_12),
              ProfileOption(
                title: AppTextsEnglish.Change_Language.tr,
                iconData: Icons.language,
                onTap: controller.toggleLanguage,
              ),
              const SizedBox(height: AppConstants.val_12),
              ProfileOption(
                title: AppTextsEnglish.About_Us.tr,
                iconData: Icons.info,
                onTap: controller.aboutAs,
              ),
              const SizedBox(height: AppConstants.val_12),
              ProfileOption(
                title: AppTextsEnglish.Log_Out.tr,
                iconData: Icons.exit_to_app,
                onTap: controller.logOut,
              ),
              const SizedBox(height: AppConstants.val_12),
            ],
          ),
        ),
      ),
    );
  }
}
