import 'package:auto_size_text/auto_size_text.dart';
import 'package:bio_medika/controllers/notification_controller.dart';
import 'package:bio_medika/core/constant/app_border_radius.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/helpers/get_name.dart';
import 'package:bio_medika/core/helpers/get_notification_des_info.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:bio_medika/models/notificatoin_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.notificationModel,
  });
  final NotificationModel notificationModel;
  @override
  Widget build(BuildContext context) {
    bool isArabic = Get.find<MyAppServices>().appIsArabic();
    (Color, IconData) desInfo =
        getNotificationColorAndIcon(notificationModel.type);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.val_16,
        vertical: AppConstants.val_6,
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(vertical: AppConstants.val_8),
        shape: const RoundedRectangleBorder(
            borderRadius: AppBorderRadius.borderRadius_10),
        tileColor: desInfo.$1,
        leading: Container(
          margin: EdgeInsets.only(
            left: !isArabic ? AppConstants.val_11 : AppConstants.val_0,
            right: isArabic ? AppConstants.val_11 : AppConstants.val_0,
          ),
          height: AppConstants.val_38,
          width: AppConstants.val_38,
          decoration: BoxDecoration(
            color: AppColor.white.withOpacity(0.3),
            borderRadius: AppBorderRadius.borderRadius_100,
          ),
          child: Icon(
            desInfo.$2,
            color: AppColor.white,
            size: AppConstants.val_26,
          ),
        ),
        title: AutoSizeText(
          maxFontSize: AppConstants.val_14,
          minFontSize: AppConstants.val_6,
          maxLines: 1,
          getTextLang(
            nameEnglish: notificationModel.titleEn,
            nameArabic: notificationModel.titleAr,
          ),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.white,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: AppConstants.val_2),
          child: AutoSizeText(
            maxFontSize: AppConstants.val_12,
            minFontSize: AppConstants.val_4,
            maxLines: 2,
            getTextLang(
              nameEnglish: notificationModel.bodyEn,
              nameArabic: notificationModel.bodyAr,
            ),
            style: TextStyle(
              height: 1.1,
              fontWeight: FontWeight.w500,
              color: AppColor.white.withOpacity(0.9),
            ),
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            Get.find<NotificationControllerImp>()
                .removeNotifications(notificationModel.id);
          },
          icon: const Icon(
            Icons.close,
            color: AppColor.white,
          ),
        ),
      ),
    );
  }
}
