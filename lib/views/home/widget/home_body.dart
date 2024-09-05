import 'package:bio_medika/controllers/homa_page_controller.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/enum/typy_search.dart';
import 'package:bio_medika/core/ui/components/handling_data.dart';

import 'package:bio_medika/views/home/widget/custom_search_bar.dart';
import 'package:bio_medika/views/home/widget/get_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomaePageControllerImp>(builder: (controller) {
      return controller.statusRequest == StatusRequest.success
          ? const RefHelpTop()
          : const RefHelpBottm();
    });
  }
}

class RefHelpTop extends StatelessWidget {
  const RefHelpTop({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<HomaePageControllerImp>(builder: (controller) {
      return Column(children: [
        const SizedBox(height: AppConstants.val_4),
        CustomSearchBarWidget(
          onTap: controller.changeTypeSearch,
          hint: controller.typeSearch == TypeSearch.inCategory
              ? AppTextsEnglish.Search_in_categories.tr
              : AppTextsEnglish.Search_in_medicines.tr,
          size: size,
          suffixIcon: true,
          controller: controller.searchController,
          focusNode: controller.focusNode,
          typeSearch: controller.typeSearch,
        ),
        const SizedBox(height: AppConstants.val_15),
        Expanded(
          child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                RequestStatusHandler(
                    statusRequest: controller.statusRequest,
                    needSearch: true,
                    loading: false,
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: getWidget(controller.typeSearch, controller,
                        controller.lastSearch)),
              ]),
        )
      ]);
    });
  }
}

class RefHelpBottm extends StatelessWidget {
  const RefHelpBottm({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<HomaePageControllerImp>(builder: (controller) {
      return Column(children: [
        const SizedBox(height: AppConstants.val_4),
        CustomSearchBarWidget(
          onTap: controller.changeTypeSearch,
          hint: controller.typeSearch == TypeSearch.inCategory
              ? AppTextsEnglish.Search_in_categories.tr
              : AppTextsEnglish.Search_in_medicines.tr,
          size: size,
          suffixIcon: true,
          controller: controller.searchController,
          focusNode: controller.focusNode,
          typeSearch: controller.typeSearch,
        ),
        const SizedBox(height: AppConstants.val_15),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              RequestStatusHandler(
                  statusRequest: controller.statusRequest,
                  needSearch: true,
                  loading: false,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: getWidget(controller.typeSearch, controller,
                      controller.lastSearch)),
            ],
          ),
        )
      ]);
    });
  }
}
