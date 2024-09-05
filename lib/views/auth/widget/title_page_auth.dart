import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitlePageAuth extends StatelessWidget {
  const TitlePageAuth(
      {super.key,
      required this.title,
      this.textSize = AppConstants.val_36,
      this.fontWeight = FontWeight.bold});
  final String title;
  final double textSize;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    MyAppServices myAppServices = Get.find();

    return Align(
      alignment: myAppServices.appIsArabic()
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Text(
        textAlign:
            myAppServices.appIsArabic() ? TextAlign.right : TextAlign.left,
        title,
        style: TextStyle(
          color: AppColor.black,
          fontSize: textSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
