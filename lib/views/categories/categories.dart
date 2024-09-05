import 'package:bio_medika/controllers/categories_controller.dart';
import 'package:bio_medika/core/ui/components/handling_data.dart';
import 'package:bio_medika/views/categories/widget/categories_body.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(CartegoriesControllerImp());
    return Scaffold(
      body: GetBuilder<CartegoriesControllerImp>(builder: (controller) {
        return RequestStatusHandler(
          statusRequest: controller.statusRequest,
          isBottomNav: false,
          loading: true,
          child: const CategoriesBody(),
        );
      }),
    );
  }
}
