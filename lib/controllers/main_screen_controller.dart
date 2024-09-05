import 'package:bio_medika/controllers/cart_controller.dart';
import 'package:bio_medika/controllers/firebase_controller.dart';
import 'package:bio_medika/controllers/homa_page_controller.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';

import 'package:bio_medika/views/cart/cart.dart';
import 'package:bio_medika/core/constant/app_assets_png.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/navigation/app_routes.dart';
import 'package:bio_medika/views/favorite/favorite.dart';
import 'package:bio_medika/views/home/home_page.dart';
import 'package:bio_medika/views/notification/notification.dart' as ntification;
import 'package:bio_medika/views/order/order.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MainScreenController extends GetxController {
  changePage(int index);
  void fillTitleAppBar();
  void fillTitleButtonAppBar();
  void goToProfile();
  void addOrder();
}

class MainScreenControllerImp extends MainScreenController {
  int currentPage = 2;

  List<Widget> listPage = [
    const ntification.Notification(),
    const Order(),
    const HomePage(),
    const Cart(),
    const Favorite(),
  ];
  late List<String> titleButtonAppBar = [];
  late List<String> titleAppBar = [];

  List<String> imageButtonAppBar = [
    AppAssetsPng.inotification,
    AppAssetsPng.iBox,
    AppAssetsPng.iHome,
    AppAssetsPng.iCartPlus,
    AppAssetsPng.iFavorite1,
  ];

  @override
  void fillTitleButtonAppBar() {
    bool ref = titleButtonAppBar.isEmpty;
    titleButtonAppBar = [
      AppTextsEnglish.Notifications.tr,
      AppTextsEnglish.My_Orders.tr,
      AppTextsEnglish.Home.tr,
      AppTextsEnglish.Cart.tr,
      AppTextsEnglish.Favorite.tr,
    ];
    if (!ref) update();
  }

  @override
  void fillTitleAppBar() {
    bool ref = titleAppBar.isEmpty;
    titleAppBar = [
      AppTextsEnglish.Notifications.tr,
      AppTextsEnglish.My_Orders.tr,
      AppTextsEnglish.Home.tr,
      AppTextsEnglish.Cart.tr,
      AppTextsEnglish.Favorite.tr,
    ];
    if (!ref) update();
  }

  @override
  void goToProfile() {
    NavigationService.profile();
  }

  @override
  void addOrder() async {
    final controller = Get.find<CartControllerImp>();
    if (controller.active) return;
    await controller.orderNow();
  }

  @override
  void onInit() async {
    Get.put(FirebaseControllerImp()).init();

    fillTitleButtonAppBar();
    fillTitleAppBar();

    super.onInit();
  }

  @override
  changePage(int index) async {
    if (index == 2 && currentPage != index) {
      final HomaePageControllerImp controllerHome =
          Get.find<HomaePageControllerImp>();
      controllerHome.searchController.text = '';
      controllerHome.listMedication = controllerHome.fullMedication;
      controllerHome.listCategory = controllerHome.fullCategory;
      controllerHome.lastSearch = null;
      if (controllerHome.statusRequest == StatusRequest.search ||
          StatusRequest.failSearch == controllerHome.statusRequest) {
        controllerHome.statusRequest = StatusRequest.success;
      } else if (controllerHome.statusRequest == StatusRequest.serverFailure ||
          controllerHome.statusRequest == StatusRequest.offline ||
          controllerHome.statusRequest == StatusRequest.serverException) {
        controllerHome.init();
      }
      controllerHome.update();
    }
    currentPage = index;
    update();
  }
}
