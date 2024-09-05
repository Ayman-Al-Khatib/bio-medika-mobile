import 'dart:async';

import 'package:bio_medika/controllers/drug_controller.dart';
import 'package:bio_medika/controllers/expired_controller.dart';
import 'package:bio_medika/controllers/favorite_controller.dart';
import 'package:bio_medika/controllers/homa_page_controller.dart';
import 'package:bio_medika/core/data/favorite_data.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/helpers/get_color_category.dart';
import 'package:bio_medika/core/services/cart_storage.dart';
import 'package:bio_medika/models/medication_model.dart';
import 'package:bio_medika/models/response_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class DrugDetailsController extends GetxController {
  void addFavorite(MedicationModel medicationModel);
  void removeFavorite(MedicationModel medicationModel);
  void favorite(bool value);
  void addOrRemoveOne({bool isAdd = true});
  void addContinuous({bool isAdd = true});
  String totalPrice();
  void addToCart();
}

class DrugDetailsControllerImp extends DrugDetailsController {
  late MedicationModel medicationModel;
  late (Color, Color, String) infoDes;
  late StatusRequest statusRequest;
  late FavoriteData favoriteData;
  late CartStorage cartStorage;
  late int quantity;
  late Timer timer;
  bool ischanged = true;
  late String? tag;
  @override
  Future<bool> addFavorite(MedicationModel medicationModel) async {
    ResponseData response = await favoriteData.addFavorite(medicationModel.id);

    return response.statusRequest == StatusRequest.success;
  }

  @override
  Future<bool> removeFavorite(MedicationModel medicationModel) async {
    ResponseData response =
        await favoriteData.removeFavorite(medicationModel.id);

    return response.statusRequest == StatusRequest.success;
  }

  @override
  Future<bool> favorite(bool value) async {
    if (!ischanged) return false;
    ischanged = false;

    //*_1

    if (value && await removeFavorite(medicationModel)) {
      if (Get.isRegistered<FavoriteControllerImp>()) {
        Get.find<FavoriteControllerImp>()
            .listFavorite
            .removeWhere((element) => element.id == medicationModel.id);
        if (Get.find<FavoriteControllerImp>().listFavorite.isEmpty) {
          Get.find<FavoriteControllerImp>().statusRequest = StatusRequest.empty;
        }
        Get.find<FavoriteControllerImp>().update();
      }

      if (Get.isRegistered<DrugControllerImp>()) {
        Get.find<DrugControllerImp>().listDrug.forEach((medication) {
          if (medication.id == medicationModel.id) {
            medication.favorate = false;
          }
        });
        Get.find<DrugControllerImp>().update();
      }

      if (Get.isRegistered<ExpiredControllerImp>()) {
        Get.find<ExpiredControllerImp>().listDrug.forEach((medication) {
          if (medication.id == medicationModel.id) {
            medication.favorate = false;
          }
        });
        Get.find<ExpiredControllerImp>().update();
      }

      if (Get.isRegistered<HomaePageControllerImp>()) {
        Get.find<HomaePageControllerImp>().fullMedication.forEach((medication) {
          if (medication.id == medicationModel.id) {
            medication.favorate = false;
          }
        });
        Get.find<HomaePageControllerImp>().listMedication.forEach((medication) {
          if (medication.id == medicationModel.id) {
            medication.favorate = false;
          }
        });

        Get.find<HomaePageControllerImp>()
            .listMostPopular
            .forEach((medication) {
          if (medication.id == medicationModel.id) {
            medication.favorate = false;
          }
        });
        Get.find<HomaePageControllerImp>().listDailySale.forEach((medication) {
          if (medication.id == medicationModel.id) {
            medication.favorate = false;
          }
        });

        Get.find<HomaePageControllerImp>().update();
      }
      ischanged = true;
      return !value;
    }

    //*_2
    else if (!value && await addFavorite(medicationModel)) {
      if (Get.isRegistered<FavoriteControllerImp>()) {
        Get.find<FavoriteControllerImp>()
            .listFavorite
            .add(medicationModel..favorate = true);

        Get.find<FavoriteControllerImp>().statusRequest = StatusRequest.success;

        Get.find<FavoriteControllerImp>().update();
      }
      if (Get.isRegistered<DrugControllerImp>()) {
        Get.find<DrugControllerImp>().listDrug.forEach((medication) {
          if (medication.id == medicationModel.id) {
            medication.favorate = true;
          }
        });
        Get.find<DrugControllerImp>().update();
      }
      if (Get.isRegistered<HomaePageControllerImp>()) {
        Get.find<HomaePageControllerImp>().fullMedication.forEach((medication) {
          if (medication.id == medicationModel.id) {
            medication.favorate = true;
          }
        });
        Get.find<HomaePageControllerImp>().listMedication.forEach((medication) {
          if (medication.id == medicationModel.id) {
            medication.favorate = true;
          }
        });

        Get.find<HomaePageControllerImp>()
            .listMostPopular
            .forEach((medication) {
          if (medication.id == medicationModel.id) {
            medication.favorate = true;
          }
        });
        Get.find<HomaePageControllerImp>().listDailySale.forEach((medication) {
          if (medication.id == medicationModel.id) {
            medication.favorate = true;
          }
        });

        Get.find<HomaePageControllerImp>().update();
      }
      ischanged = true;
      return !value;
    }

    //*_3
    else {
      ischanged = true;

      return value;
    }
  }

  @override
  void addContinuous({bool isAdd = true}) async {
    timer = Timer.periodic(const Duration(milliseconds: 50), (Timer t) {
      addOrRemoveOne(isAdd: isAdd);
    });
  }

  @override
  void addOrRemoveOne({bool isAdd = true}) {
    if (quantity == 1 && !isAdd) return;
    quantity += isAdd ? 1 : -1;
    update();
  }

  @override
  void onInit() {
    favoriteData = FavoriteData(Get.find());
    cartStorage = CartStorage();
    quantity = 1;
    Map<String, dynamic> arguments = Get.arguments;
    medicationModel = arguments['medicationModel'];
    tag = arguments['tag'];
    infoDes = getColorCategory(0);
    super.onInit();
  }

  @override
  String totalPrice() {
    double total = medicationModel.finalPrice * quantity;
    if (total.toString().split('.')[1].length > 1 &&
        total.toString().split('.')[1][1] != '0') {
      return total.toStringAsFixed(2);
    }
    return total.toStringAsFixed(1);
  }

  @override
  void addToCart() async {
    await cartStorage.addCartFromMedication(medicationModel, quantity);
    quantity = 1;
    update();
  }
}
