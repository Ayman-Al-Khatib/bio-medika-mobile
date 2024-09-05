import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrugDetailsTopBar extends StatelessWidget {
  const DrugDetailsTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppConstants.val_45),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Visibility(
              visible: !Get.find<MyAppServices>().appIsArabic(),
              child: SizedBox(
                width: AppConstants.val_100,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back, color: AppColor.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
