import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/constant/app_theme.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  late Locale language;
  MyAppServices myAppServices = Get.find();
  ThemeData appTheme = AppTheme.themeEnglish;

  chnageToArabic() {
    appTheme = AppTheme.themeArabic;
    myAppServices.putValue(AppTextsEnglish.direction, AppTextsEnglish.rtl);
    language = const Locale(AppTextsEnglish.ar);
  }

  changeToEnglish() {
    appTheme = AppTheme.themeEnglish;
    myAppServices.putValue(AppTextsEnglish.direction, AppTextsEnglish.ltr);
    language = const Locale(AppTextsEnglish.en);
  }

  changeLanguage(String langcode) {
    myAppServices.putValue(AppTextsEnglish.lang, langcode);

    if (langcode == AppTextsEnglish.ar) {
      chnageToArabic();
    } else {
      changeToEnglish();
    }

    Get.changeTheme(appTheme);
    Get.updateLocale(language);
  }

  @override
  void onInit() {
    String langApp = myAppServices.getValue(AppTextsEnglish.lang,
        defaultValue: Get.deviceLocale!.languageCode);
    if (langApp == AppTextsEnglish.ar) {
      chnageToArabic();
    } else if (langApp == AppTextsEnglish.en) {
      changeToEnglish();
    }
    super.onInit();
  }
}
