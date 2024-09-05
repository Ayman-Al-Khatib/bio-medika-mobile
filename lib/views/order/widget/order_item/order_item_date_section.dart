import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateSection extends StatelessWidget {
  final DateTime dataTime;
  const DateSection({super.key, required this.dataTime});
  @override
  Widget build(BuildContext context) {
    return Text(
      formatDate(dataTime),
      style: const TextStyle(
        fontSize: AppConstants.val_12,
        color: AppColor.iconAndTextGrey,
        fontWeight: FontWeight.w500,
        fontFamily: '-',
      ),
    );
  }

  String formatDate(DateTime dateTime) {
    initializeDateFormatting();
    final formatter = DateFormat(
      'yyyy/MM/dd, h:mm a',
      Get.find<MyAppServices>().appIsArabic()
          ? AppTextsEnglish.ar
          : AppTextsEnglish.en,
    );
    return formatter.format(dateTime);
  }
}
