import 'package:bio_medika/controllers/drug_controller.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/ui/components/handling_data.dart';
import 'package:bio_medika/views/drugs/widget/custom_drug_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListSliverAppBarDrug extends StatelessWidget {
  const CustomListSliverAppBarDrug({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverPadding(
        padding: const EdgeInsets.only(
            left: AppConstants.val_18,
            right: AppConstants.val_18,
            bottom: AppConstants.val_10),
        sliver: GetBuilder<DrugControllerImp>(builder: (controller) {
          return RequestStatusHandler(
            statusRequest: controller.statusRequest,
            height: size.height - size.height * 0.45 - AppConstants.val_55,
            isSliver: true,
            loading: false,
            needSearch: true,
            child: GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: AppConstants.val_15,
                mainAxisSpacing: AppConstants.val_15,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (BuildContext context, int index) {
                return CustomDrugItem(
                  medicationModel: controller.listDrug[index],
                  goToDrugsDetails: controller.goToDrugsDetails,
                  favorite: controller.favorite,
                );
              },
              itemCount: controller.listDrug.length,
            ),
          );
        }));
  }
}
