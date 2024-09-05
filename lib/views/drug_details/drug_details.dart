import 'package:bio_medika/controllers/drug_details_controller.dart';
import 'package:bio_medika/views/drug_details/widget/drug_details_body.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrugDetails extends StatelessWidget {
  const DrugDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final DrugDetailsControllerImp controller =
        Get.put(DrugDetailsControllerImp());
    return Scaffold(
      backgroundColor: controller.infoDes.$2,
      body: const DrugDetailsBody(),
    );
  }
}
