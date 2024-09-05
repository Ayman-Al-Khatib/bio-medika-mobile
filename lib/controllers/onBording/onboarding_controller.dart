import 'package:bio_medika/core/constant/app_route.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/navigation/app_routes.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  void nextPage();
  void previousPage();
  void goToLogin();
}

class OnBoardingControllerImp extends OnBoardingController {
  final RxInt currentPage = 0.obs;
  final MyAppServices _myAppServices = Get.find();
  late final PageController pageController;

  @override
  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void previousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    pageController.addListener(() {
      currentPage.value = pageController.page?.round() ?? 0;
    });
  }

  @override
  void goToLogin() {
    _myAppServices.putValue(AppTextsEnglish.position, AppRoutes.login);
    NavigationService.login();
  }
}
