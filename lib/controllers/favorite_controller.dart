import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/data/drugs_data.dart';
import 'package:bio_medika/core/data/favorite_data.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/helpers/get_color_category.dart';
import 'package:bio_medika/core/navigation/app_routes.dart';
import 'package:bio_medika/core/ui/shared/snacbar_widget.dart';
import 'package:bio_medika/models/medication_model.dart';
import 'package:bio_medika/models/response_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class FavoriteController extends GetxController {
  Future<bool> removeFavorite(String id);
  Future<void> getAllFavorite();
  Future<void> getOneDrug(String id);
  void search();
}

class FavoriteControllerImp extends FavoriteController {
  late StatusRequest statusRequest;
  late FavoriteData favoriteData;
  late List<MedicationModel> listFavorite;
  late List<MedicationModel> fullFavorite;
  late TextEditingController searchController;
  late FocusNode focusNode;
  String? lastSearch;
  late DrugsData drugsData;
  bool action = false;

  @override
  Future<bool> removeFavorite(String id) async {
    action = true;
    ResponseData response = await favoriteData.removeFavorite(id);
    if (response.statusRequest == StatusRequest.success) {
      fullFavorite = fullFavorite.where((element) => element.id != id).toList();
      listFavorite = fullFavorite;
      if (listFavorite.isEmpty) {
        statusRequest = StatusRequest.empty;
      }

      action = false;

      update();
      return true;
    }
    action = false;
    return false;
  }

  @override
  Future<void> getAllFavorite() async {
    statusRequest = StatusRequest.loading;
    update();
    ResponseData responseData = await favoriteData.getFavorite();

    statusRequest = responseData.statusRequest;
    if (responseData.statusRequest == StatusRequest.success) {
      fullFavorite =
          listFavorite = MedicationModel.listFromJson(responseData.data);
    }

    update();
  }

  @override
  Future<void> getOneDrug(String id) async {
    ResponseData responseData = await drugsData.getOneDrugs(id: id);
    if (responseData.statusRequest == StatusRequest.success) {
      MedicationModel medicationModel =
          MedicationModel.fromJson(responseData.data);
      await NavigationService.drugDetails(argument: {
        "medicationModel": medicationModel,
        "infoDes": getColorCategory(0)
      });
      update();
    }
    if (responseData.statusRequest == StatusRequest.failure) {
      await showCustomSnackbar(
        title: AppTextsEnglish.Error.tr,
        message: responseData.errors,
        backgroundGradient: const LinearGradient(
          colors: [AppColor.redAccent, AppColor.pinkAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: AppConstants.val_15,
        duration: const Duration(seconds: 4),
      ).then((value) {
        update();
      });
    }
  }

  @override
  void search() async {
    if (focusNode.hasFocus || lastSearch == searchController.text) {
      lastSearch = searchController.text;
      return;
    }
    if (searchController.text.isEmpty) {
      listFavorite = fullFavorite;
      statusRequest = StatusRequest.success;
      lastSearch = null;
      update();
      return;
    }

    statusRequest = StatusRequest.search;
    update();
    await Future.delayed(const Duration(seconds: 2)); //*
    listFavorite = searchMedications(fullFavorite, searchController.text);
    lastSearch = searchController.text;
    if (listFavorite.isEmpty) {
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

  @override
  void onInit() {
    statusRequest = StatusRequest.none;
    favoriteData = FavoriteData(Get.find());
    searchController = TextEditingController();
    focusNode = FocusNode();
    focusNode.addListener(() => search());

    listFavorite = fullFavorite = [];

    getAllFavorite();
    drugsData = DrugsData(Get.find());
    super.onInit();
  }
}
