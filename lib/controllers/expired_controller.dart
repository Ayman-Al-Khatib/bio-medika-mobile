import 'package:bio_medika/controllers/drug_details_controller.dart';
import 'package:bio_medika/controllers/favorite_controller.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/data/drugs_data.dart';
import 'package:bio_medika/core/data/favorite_data.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/navigation/app_routes.dart';
import 'package:bio_medika/models/medication_model.dart';
import 'package:bio_medika/models/response_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ExpiredController extends GetxController {
  void changeFavorite(bool value) {}
  void addToCart({
    required int id,
    required int quantity,
    required String name,
    required double price,
    required double discount,
  });
  void search();
  void getDrugOneMonth();
  void getDrugThreeMonth();
  void addFavorite(MedicationModel medicationModel);
  void removeFavorite(MedicationModel medicationModel);
  void favorite(MedicationModel medicationModel, bool value);
  void goToDrugsDetails(MedicationModel medicationModel, String tag);
}

class ExpiredControllerImp extends ExpiredController {
  late (Color, Color, String) infoDes;
  late List<MedicationModel> listDrug;
  late List<MedicationModel> fullData;
  late StatusRequest statusRequest;
  late DrugsData drugsData;
  late FavoriteData favoriteData;
  late TextEditingController searchController;
  late FocusNode focusNode;
  late String image;
  String? lastSearch;
  bool ischanged = true;

  @override
  void getDrugOneMonth() async {
    statusRequest = StatusRequest.loading;
    update();
    ResponseData responseData = await drugsData.getUnderOneMonth();
    statusRequest = responseData.statusRequest;
    if (responseData.statusRequest == StatusRequest.success) {
      listDrug = fullData = MedicationModel.listFromJson(responseData.data);
    }
    update();
  }

  @override
  void getDrugThreeMonth() async {
    statusRequest = StatusRequest.loading;
    update();

    ResponseData responseData = await drugsData.getUnderThreeMonth();
    statusRequest = responseData.statusRequest;
    if (responseData.statusRequest == StatusRequest.success) {
      listDrug = fullData = MedicationModel.listFromJson(responseData.data);
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
    image = arguments['image'];
    infoDes =
        (AppColor.categoryItemBackground_1, AppColor.categoryItemIcon_1, '');
    drugsData = DrugsData(Get.find());
    favoriteData = FavoriteData(Get.find());
    searchController = TextEditingController();
    focusNode = FocusNode();
    statusRequest = StatusRequest.none;
    focusNode.addListener(() => search());
    listDrug = fullData = [];
    if (arguments['isOneMonth']) {
      getDrugOneMonth();
    } else {
      getDrugThreeMonth();
    }
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
        Get.find<FavoriteControllerImp>().update();
      }

      if (Get.isRegistered<DrugDetailsControllerImp>()) {
        Get.find<DrugDetailsControllerImp>().medicationModel.favorate = false;
        Get.find<DrugDetailsControllerImp>().update();
      }

      medicationModel.favorate = false;
      ischanged = true;
      return !value;
    } else if (!value && await addFavorite(medicationModel)) {
      medicationModel.favorate = true;

      if (Get.isRegistered<FavoriteControllerImp>()) {
        Get.find<FavoriteControllerImp>().listFavorite.add(medicationModel);
        Get.find<FavoriteControllerImp>().update();
      }
      if (Get.isRegistered<DrugDetailsControllerImp>()) {
        Get.find<DrugDetailsControllerImp>().medicationModel.favorate = true;
        Get.find<DrugDetailsControllerImp>().update();
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
    await Future.delayed(const Duration(seconds: 2));
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
