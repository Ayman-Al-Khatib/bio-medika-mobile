import 'package:bio_medika/controllers/drug_details_controller.dart';
import 'package:bio_medika/controllers/favorite_controller.dart';
import 'package:bio_medika/core/data/categories_data.dart';
import 'package:bio_medika/core/data/drugs_data.dart';
import 'package:bio_medika/core/data/favorite_data.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/enum/typy_search.dart';
import 'package:bio_medika/core/navigation/app_routes.dart';
import 'package:bio_medika/models/categories_model.dart';
import 'package:bio_medika/models/medication_model.dart';
import 'package:bio_medika/models/response_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomaePageController extends GetxController {
  Future<StatusRequest> getCategory();
  openCategory(CategoriesModel categoriesModel);
  Future<StatusRequest> getMostPopular();
  Future<StatusRequest> getDailySale();
  void goToDrugsDetails(MedicationModel medicationModel, String tag);
  Future<bool> favorite(MedicationModel medicationModel, bool value);
  Future<bool> removeFavorite(MedicationModel medicationModel);
  Future<bool> addFavorite(MedicationModel medicationModel);
  Future<StatusRequest> getMedication();
  void search();
  void changeTypeSearch();
}

class HomaePageControllerImp extends HomaePageController {
  late StatusRequest statusRequest;
  late List<CategoriesModel> listCategory;
  late List<MedicationModel> listMostPopular;
  late List<MedicationModel> listMedication;
  late List<MedicationModel> listDailySale;
  late List<CategoriesModel> fullCategory;
  late List<MedicationModel> fullMedication;
  late TypeSearch typeSearch;
  late CategoryData categoryData;
  late DrugsData drugsData;
  bool ischanged = true;
  late FavoriteData favoriteData;
  late TextEditingController searchController;
  late FocusNode focusNode;
  String? lastSearch;
  @override
  Future<StatusRequest> getCategory() async {
    ResponseData response = await CategoryData(Get.find()).getCategory();
    if (response.statusRequest == StatusRequest.success) {
      listCategory = fullCategory =
          List.from(response.data.map((e) => CategoriesModel.fromJson(e)));
    }
    return response.statusRequest;
  }

  @override
  openCategory(categoriesModel) {
    NavigationService.drug(argument: {
      'categoriesModel': categoriesModel,
    });
  }

  @override
  Future<StatusRequest> getMostPopular() async {
    ResponseData response = await drugsData.getmostPopular();
    if (response.statusRequest == StatusRequest.success) {
      listMostPopular = MedicationModel.listFromJson(response.data);
    }
    return response.statusRequest;
  }

  @override
  Future<StatusRequest> getMedication() async {
    ResponseData response = await drugsData.getAllDrugs();
    if (response.statusRequest == StatusRequest.success) {
      listMedication =
          fullMedication = MedicationModel.listFromJson(response.data);
    }
    return response.statusRequest;
  }

  @override
  Future<StatusRequest> getDailySale() async {
    ResponseData response = await drugsData.getDailySale();
    if (response.statusRequest == StatusRequest.success) {
      listDailySale = MedicationModel.listFromJson(response.data);
    }
    return response.statusRequest;
  }

  @override
  void goToDrugsDetails(MedicationModel medicationModel, String tag) async {
    NavigationService.drugDetails(argument: {
      'medicationModel': medicationModel,
      'tag': tag,
    });
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

      medicationModel.favorate = false;
      ischanged = true;
      return !value;
    } else if (!value && await addFavorite(medicationModel)) {
      medicationModel.favorate = true;

      if (Get.isRegistered<FavoriteControllerImp>()) {
        Get.find<FavoriteControllerImp>().listFavorite.add(medicationModel);

        Get.find<FavoriteControllerImp>().statusRequest = StatusRequest.success;

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

  Future<void> init() async {
    statusRequest = StatusRequest.loading;
    update();
    searchController.text = '';
    lastSearch = null;

    List<StatusRequest> results = await Future.wait([
      getCategory(),
      getMostPopular(),
      getDailySale(),
      getMedication(),
    ]);

    if (results[0] == StatusRequest.success &&
        results[1] == StatusRequest.success &&
        results[2] == StatusRequest.success &&
        results[3] == StatusRequest.success) {
      statusRequest = StatusRequest.success;
    } else {
      statusRequest = results[3];
    }
    update();
  }

  @override
  void search() async {
    if (focusNode.hasFocus || lastSearch == searchController.text) {
      lastSearch = searchController.text;
      return;
    }
    if (searchController.text.isEmpty) {
      listMedication = fullMedication;
      listCategory = fullCategory;
      statusRequest = StatusRequest.success;
      lastSearch = null;
      update();
      return;
    }

    statusRequest = StatusRequest.search;
    update();

    await Future.delayed(const Duration(seconds: 2));
    if (typeSearch == TypeSearch.inDrug) {
      listMedication = searchMedications(fullMedication, searchController.text);
      lastSearch = searchController.text;
      if (listMedication.isEmpty) {
        statusRequest = StatusRequest.failSearch;
      } else {
        statusRequest = StatusRequest.success;
      }
    } else if (typeSearch == TypeSearch.inCategory) {
      listCategory = searchCategory(fullCategory, searchController.text);

      lastSearch = searchController.text;
      if (listCategory.isEmpty) {
        statusRequest = StatusRequest.failSearch;
      } else {
        statusRequest = StatusRequest.success;
      }
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

  List<CategoriesModel> searchCategory(
      List<CategoriesModel> categories, String query) {
    query = query.toLowerCase().trim();
    return categories.where((category) {
      String simplifiedArabicQuery = simplifyArabic(query);
      bool matchesEnglishName = category.nameEn.toLowerCase().contains(query);
      bool matchesArabicName =
          simplifyArabic(category.nameAr).contains(simplifiedArabicQuery);

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
    statusRequest = StatusRequest.loading;
    listCategory = fullCategory = [];
    listDailySale = listMostPopular = fullMedication = [];
    typeSearch = TypeSearch.inDrug;
    searchController = TextEditingController();
    focusNode = FocusNode();
    focusNode.addListener(() => search());
    categoryData = CategoryData(Get.find());
    favoriteData = FavoriteData(Get.find());
    drugsData = DrugsData(Get.find());
    init();
    super.onInit();
  }

  @override
  void changeTypeSearch() {
    searchController.text = '';
    statusRequest = StatusRequest.success;
    lastSearch = null;
    if (typeSearch == TypeSearch.inCategory){ 
      typeSearch = TypeSearch.inDrug;
      listMedication=fullMedication;
      listCategory=fullCategory;
    } else if (typeSearch == TypeSearch.inDrug) {
      typeSearch = TypeSearch.inCategory;
      listMedication=fullMedication;
      listCategory=fullCategory;
    }
    update();
  }
}
