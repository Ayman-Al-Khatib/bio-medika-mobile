import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bio_medika/controllers/firebase_controller.dart';
import 'package:bio_medika/controllers/profile/profile_controller.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/navigation/app_routes.dart';
import 'package:bio_medika/core/services/cart_storage.dart';
import 'package:bio_medika/core/services/notification_storage.dart';
import 'package:bio_medika/core/ui/shared/snacbar_widget.dart';
import 'package:bio_medika/models/user_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileActionController extends ProfileControllerImp {
  @override
  void toggleNotification() async {
    if (statusRequest != StatusRequest.success &&
        statusRequest != StatusRequest.none) {
      return null;
    }
    statusRequest = StatusRequest.loading;
    update();
    await AwesomeDialog(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.val_14),
      context: Get.context!,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      title: AppTextsEnglish.Change_Notification_Settings.tr,
      desc: notifications
          ? AppTextsEnglish.Are_you_sure_you_want_to_disable_notifications.tr
          : AppTextsEnglish.Are_you_sure_you_want_to_enable_notifications.tr,
      titleTextStyle: const TextStyle(
        fontSize: AppConstants.val_17,
        fontWeight: FontWeight.w600,
      ),
      btnCancelText: AppTextsEnglish.cancel.tr,
      btnOkText: AppTextsEnglish.Ok.tr,
      descTextStyle: const TextStyle(
        fontSize: AppConstants.val_14,
        fontWeight: FontWeight.w500,
      ),
      btnCancelOnPress: () {
        statusRequest = StatusRequest.empty;
        update();
      },
      btnOkOnPress: () async {
        myAppServices.putValue(
          AppTextsEnglish.Notification,
          notifications ? AppTextsEnglish.false_ : AppTextsEnglish.true_,
        );
        if (notifications) {
          FirebaseMessaging.instance.unsubscribeFromTopic(UserModel.get().id);
          FirebaseMessaging.instance.unsubscribeFromTopic("user");
        } else {
          Get.find<FirebaseControllerImp>().init();
        }
        notifications = !notifications;
        statusRequest = StatusRequest.finished;

        update();
      },
    ).show();

    if (statusRequest == StatusRequest.finished) {
      await showCustomSnackbar(
        title: AppTextsEnglish.Notifications.tr,
        message: notifications
            ? AppTextsEnglish.Notifications_have_been_successfully_turned_on.tr
            : AppTextsEnglish
                .Notifications_have_been_successfully_turned_off.tr,
        backgroundGradient: LinearGradient(
          colors: notifications
              ? [AppColor.profilePackground_2, AppColor.primary]
              : const [AppColor.redAccent, AppColor.pinkAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: AppConstants.val_15,
        duration: const Duration(seconds: 2),
      ).then((value) {
        statusRequest = StatusRequest.success;
        update();
      });
    } else {
      statusRequest = StatusRequest.success;
      update();
    }
  }

  @override
  void toggleLanguage() async {
    if (statusRequest != StatusRequest.success &&
        statusRequest != StatusRequest.none) {
      return null;
    }

    statusRequest = StatusRequest.loading;
    update();
    await AwesomeDialog(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.val_14),
      context: Get.context!,
      dialogType: DialogType.info,
      animType: AnimType.bottomSlide,
      title: AppTextsEnglish.Change_Language.tr,
      desc: languageIsArabic
          ? AppTextsEnglish
              .Are_you_sure_you_want_to_switch_to_English_language.tr
          : AppTextsEnglish
              .Are_you_sure_you_want_to_switch_to_Arabic_language.tr,
      titleTextStyle: const TextStyle(
        fontSize: AppConstants.val_17,
        fontWeight: FontWeight.w600,
      ),
      descTextStyle: const TextStyle(
        fontSize: AppConstants.val_14,
        fontWeight: FontWeight.w500,
      ),
      btnCancelText: AppTextsEnglish.cancel.tr,
      btnOkText: AppTextsEnglish.Ok.tr,
      btnCancelOnPress: () {
        statusRequest = StatusRequest.empty;
        update();
      },
      btnOkOnPress: () async {
        localeController.changeLanguage(
            languageIsArabic ? AppTextsEnglish.en : AppTextsEnglish.ar);
        languageIsArabic = !languageIsArabic;
        statusRequest = StatusRequest.finished;
        mainScreenControllerImp.fillTitleAppBar();
        mainScreenControllerImp.fillTitleButtonAppBar();
        update();
      },
    ).show();

    // if (statusRequest == StatusRequest.finished) {
    //   await showCustomSnackbar(
    //     title: AppTextsEnglish.Change_Language.tr,
    //     message: languageIsArabic
    //         ? AppTextsEnglish.Language_has_been_successfully_switched_to_Arabic.tr
    //         : AppTextsEnglish.Language_has_been_successfully_switched_to_English.tr,
    //     backgroundGradient: LinearGradient(
    //       colors: notifications
    //           ? [AppColor.profilePackground_2, AppColor.primary]
    //           : const [AppColor.redAccent, AppColor.pinkAccent],
    //       begin: Alignment.topLeft,
    //       end: Alignment.bottomRight,
    //     ),
    //     borderRadius: AppConstants.val_15,
    //     duration: const Duration(seconds: 2),
    //   ).then((value) {
    //     statusRequest = StatusRequest.success;
    //     update();
    //   });
    // } else {
    //   statusRequest = StatusRequest.success;
    //   update();
    // }
    statusRequest = StatusRequest.success;
  }

  @override
  void aboutAs() {
    NavigationService.aboutAs();
  }

  @override
  void accountInformaiton() {
    NavigationService.accountInformation();
  }

  @override
  void favorite() {
    NavigationService.favorite();
  }

  @override
  void logOut() async {
    await AwesomeDialog(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.val_14),
      context: Get.context!,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      title: AppTextsEnglish.Confirm_Logout.tr,
      desc: AppTextsEnglish
          .Are_you_sure_you_want_to_log_out_of_your_account_Logging_out_will_require_you_to_sign_in_again_to_access_your_account
          .tr,
      titleTextStyle: const TextStyle(
        fontSize: AppConstants.val_17,
        fontWeight: FontWeight.w600,
      ),
      descTextStyle: const TextStyle(
        fontSize: AppConstants.val_14,
        fontWeight: FontWeight.w500,
      ),
      btnCancelText: AppTextsEnglish.cancel.tr,
      btnOkText: AppTextsEnglish.Ok.tr,
      btnCancelOnPress: () {},
      btnOkOnPress: () async {
        FirebaseMessaging.instance.unsubscribeFromTopic(UserModel.get().id);
        FirebaseMessaging.instance.unsubscribeFromTopic("user");
        myAppServices.putValue(AppTextsEnglish.position, AppTextsEnglish.login);
        UserModel.clean();
        CartStorage().removeAll();
        NotificationStorage().removeAll();
        NavigationService.login();
      },
    ).show();
  }

  @override
  void myOrder() {
    NavigationService.order();
  }
}
