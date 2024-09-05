import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/data/categories_data.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/navigation/app_routes.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:bio_medika/models/categories_model.dart';
import 'package:bio_medika/models/response_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartegoriesController extends GetxController {
  void updateTitleOpacity(double value);
  getData();
  goToItems(int id);
  openCategory(categoriesModel);
  void search();
}

class CartegoriesControllerImp extends CartegoriesController {
  RxDouble titleOpacity = 0.0.obs;
  late TextEditingController searchController;
  late FocusNode focusNode;
  String? lastSearch;
  late StatusRequest statusRequest;
  late CategoryData categoriesData;
  late MyAppServices myAppServices;

  late List<CategoriesModel> cartegorieslist;
  late List<CategoriesModel> _fullList;
  @override
  void onInit() {
    statusRequest = StatusRequest.loading;
    myAppServices = Get.find();
    searchController = TextEditingController();
    focusNode = FocusNode();
    categoriesData = CategoryData(Get.find());
    focusNode.addListener(() => search());
    cartegorieslist = [];
    getData();
    super.onInit();
  }

  @override
  getData() async {
    cartegorieslist.clear();
    statusRequest = StatusRequest.loading;
    update();
    ResponseData response = await categoriesData.getCategory();
    if (response.statusRequest == StatusRequest.success) {
      _fullList = cartegorieslist = CategoriesModel.listFromJson(response.data);
    }
    statusRequest = response.statusRequest;
    update();
  }

  @override
  openCategory(categoriesModel) {
    NavigationService.drug(argument: {
      'categoriesModel': categoriesModel,
    });
  }

  @override
  goToItems(int id) {
    NavigationService.drug(argument: {AppTextsEnglish.id: id});
  }

  @override
  updateTitleOpacity(double value) {
    titleOpacity.value = value.clamp(0.0, 1.0);
  }

  @override
  void search() async {
    if (focusNode.hasFocus || lastSearch == searchController.text) {
      lastSearch = searchController.text;
      return;
    }
    if (searchController.text.isEmpty) {
      cartegorieslist = _fullList;
      statusRequest = StatusRequest.success;
      lastSearch = null;
      update();
      return;
    }

    statusRequest = StatusRequest.search;
    update();
    await Future.delayed(const Duration(seconds: 2)); //*
    cartegorieslist = searchCategory(_fullList, searchController.text);
    lastSearch = searchController.text;
    if (cartegorieslist.isEmpty) {
      statusRequest = StatusRequest.failSearch;
    } else {
      statusRequest = StatusRequest.success;
    }
    update();
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
}
