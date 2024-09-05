import 'package:bio_medika/controllers/drug_controller.dart';
import 'package:bio_medika/views/drugs/widget/drug_body.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/ui/components/handling_data.dart';

class Drug extends StatelessWidget {
  const Drug({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(DrugControllerImp());
    return Scaffold(
      body: GetBuilder<DrugControllerImp>(builder: (controller) {
        return RequestStatusHandler(
          isBottomNav: false,
          statusRequest: controller.statusRequest,
          loading: true,
          height: MediaQuery.of(context).size.height,
          child: const DrugBody(),
        );
      }),
    );
  }
}
