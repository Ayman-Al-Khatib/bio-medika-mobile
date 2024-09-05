import 'package:bio_medika/controllers/drug_details_controller.dart';
import 'package:bio_medika/controllers/favorite_controller.dart';
import 'package:bio_medika/controllers/homa_page_controller.dart';
import 'package:bio_medika/core/data/drugs_data.dart';
import 'package:bio_medika/core/data/favorite_data.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/helpers/pc.dart';
import 'package:bio_medika/core/navigation/app_routes.dart';
import 'package:bio_medika/models/categories_model.dart';
import 'package:bio_medika/models/medication_model.dart';
import 'package:bio_medika/models/response_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class DrugController extends GetxController {
  updateTitleOpacity(double value);
  void changeFavorite(bool value) {}
  void addToCart({
    required int id,
    required int quantity,
    required String name,
    required double price,
    required double discount,
  });
  void search();
  void getDrug();
  void addFavorite(MedicationModel medicationModel);
  void removeFavorite(MedicationModel medicationModel);
  void favorite(MedicationModel medicationModel, bool value);
  void goToDrugsDetails(MedicationModel medicationModel, String tag);
}

class DrugControllerImp extends DrugController {
  RxDouble titleOpacity = 0.0.obs;
  late CategoriesModel categoriesModel;
  late List<MedicationModel> listDrug;
  late List<MedicationModel> fullData;
  late StatusRequest statusRequest;
  late DrugsData drugsData;
  late FavoriteData favoriteData;
  late TextEditingController searchController;
  late FocusNode focusNode;
  String? lastSearch;
  bool ischanged = true;

  @override
  updateTitleOpacity(double value) {
    titleOpacity.value = value.clamp(0.0, 1.0);
    pc(titleOpacity.value.toString());
  }

  @override
  void getDrug() async {
    statusRequest = StatusRequest.loading;
    update();
    listDrug.clear();
    ResponseData response = await drugsData.getDrugs(id: categoriesModel.id);
    statusRequest = response.statusRequest;

    if (response.statusRequest == StatusRequest.success) {
      fullData = listDrug = MedicationModel.listFromJson(response.data);
    }
    update();
  }

  @override
  void addToCart(
      {required int id,
      required int quantity,
      required String name,
      required double price,
      required double discount}) {}
  @override
  void goToDrugsDetails(MedicationModel medicationModel, String tag) async {
    NavigationService.drugDetails(
        argument: {'medicationModel': medicationModel, 'tag': tag});
  }

  @override
  void onInit() {
    Map<String, dynamic> arguments = Get.arguments ?? {};
    categoriesModel = arguments['categoriesModel'];
    favoriteData = FavoriteData(Get.find());
    searchController = TextEditingController();
    focusNode = FocusNode();
    focusNode.addListener(() => search());
    listDrug = fullData = [];
    statusRequest = StatusRequest.none;
    drugsData = DrugsData(Get.find());
    getDrug();
    super.onInit();
  }

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
  Future<bool> favorite(MedicationModel medicationModel, bool value) async {
    if (!ischanged) return false;
    ischanged = false;
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

      if (Get.isRegistered<DrugDetailsControllerImp>()) {
        Get.find<DrugDetailsControllerImp>().medicationModel.favorate = false;
        Get.find<DrugDetailsControllerImp>().update();
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
      medicationModel.favorate = false;
      ischanged = true;
      return !value;
    } else if (!value && await addFavorite(medicationModel)) {
      medicationModel.favorate = true;

      if (Get.isRegistered<FavoriteControllerImp>()) {
        Get.find<FavoriteControllerImp>()
            .listFavorite
            .add(medicationModel..favorate = true);

        Get.find<FavoriteControllerImp>().statusRequest = StatusRequest.success;

        Get.find<FavoriteControllerImp>().update();
      }
      if (Get.isRegistered<DrugDetailsControllerImp>()) {
        Get.find<DrugDetailsControllerImp>().medicationModel.favorate = true;
        Get.find<DrugDetailsControllerImp>().update();
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
    } else {
      ischanged = true;

      return value;
    }
  }

  @override
  void search() async {
    if (focusNode.hasFocus || lastSearch == searchController.text) {
      lastSearch = searchController.text;
      return;
    }
    if (searchController.text.isEmpty) {
      listDrug = fullData;
      statusRequest = StatusRequest.success;
      lastSearch = null;
      update();
      return;
    }

    statusRequest = StatusRequest.search;
    update();
    await Future.delayed(const Duration(seconds: 2)); //*
    listDrug = searchMedications(fullData, searchController.text);
    lastSearch = searchController.text;
    if (listDrug.isEmpty) {
      statusRequest = StatusRequest.failSearch;
    } else {
      statusRequest = StatusRequest.success;
    }
    update();
  }

  List<MedicationModel> searchMedications(
      List<MedicationModel> medications, String query) {
    query = query.toLowerCase().trim();
    return medications.where((medication) {
      String simplifiedArabicQuery = simplifyArabic(query);
      bool matchesEnglishName =
          medication.scientificNameEn.toLowerCase().contains(query) ||
              medication.commercialNameEn.toLowerCase().contains(query);
      bool matchesArabicName = simplifyArabic(medication.scientificNameAr)
              .contains(simplifiedArabicQuery) ||
          simplifyArabic(medication.commercialNameAr)
              .contains(simplifiedArabicQuery);

      return matchesEnglishName || matchesArabicName;
    }).toList();
  }

  String simplifyArabic(String input) {
    const arabicSimplificationMap = {
      'أ': 'ا',
      'إ': 'ا',
      'آ': 'ا',
    };
    return input
        .split('')
        .map((char) => arabicSimplificationMap[char] ?? char)
        .join();
  }
}
