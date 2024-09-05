import 'package:bio_medika/core/constant/app_route.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  final MyAppServices myAppServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    String position = myAppServices.getValue(AppTextsEnglish.position);
    if (position == AppRoutes.login) {
      return const RouteSettings(name: AppRoutes.login);
    }
    if (position == AppRoutes.mainScreen) {
      return const RouteSettings(name: AppRoutes.mainScreen);
    }
    return null;
  }
}
