import 'package:bio_medika/controllers/drug_details_controller.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrugDetailsContainer extends GetView<DrugDetailsControllerImp> {
  const DrugDetailsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: size.height * 0.5,
        decoration: BoxDecoration(
          color: controller.infoDes.$1,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(
              AppConstants.val_50,
            ),
          ),
        ),
      ),
    );
  }
}
