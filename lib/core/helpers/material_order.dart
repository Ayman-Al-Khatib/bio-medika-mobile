import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MaterialOrderStatus {
  late String status;
  late Color backgroundColor;
  late Color itemColor;

  MaterialOrderStatus({required String status}) {
    if (status == AppTextsEnglish.Pending || status == AppTextsEnglish.Unpaid) {
      this.status = status.tr;
      backgroundColor = AppColor.categoryItemBackground_1;
      itemColor = const Color.fromARGB(255, 219, 78, 80);
    }
    if (status == AppTextsEnglish.Shipped) {
      this.status = status.tr;
      backgroundColor = AppColor.categoryItemBackground_1;
      itemColor = Colors.green;
    }
    if (status == AppTextsEnglish.Delivered || status == AppTextsEnglish.Paid) {
      this.status = status.tr;
      backgroundColor = AppColor.categoryItemBackground_1;
      itemColor = AppColor.primary;
    }
    if (status == AppTextsEnglish.Cancelled) {
      this.status = status.tr;
      backgroundColor = AppColor.categoryItemBackground_1;
      itemColor = Colors.orange;
    }
  }
}
