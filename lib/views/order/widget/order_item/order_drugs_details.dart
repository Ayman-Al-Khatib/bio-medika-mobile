import 'package:bio_medika/core/constant/app_border_radius.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_fonts.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:bio_medika/models/order_model.dart';
import 'package:bio_medika/views/order/widget/order_item/order_drugs_details/order_drugs_details_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDrugsDetails extends StatelessWidget {
  const OrderDrugsDetails({super.key, required this.orderModel});
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          visualDensity: const VisualDensity(vertical: -AppConstants.val_4)),
      child: ListTileTheme(
        data: const ListTileThemeData(
          dense: true,
        ),
        child: ExpansionTile(
          childrenPadding: EdgeInsets.zero,
          initiallyExpanded: false,
          shape: const RoundedRectangleBorder(
            borderRadius: AppBorderRadius.borderRadius_20,
          ),
          expandedAlignment: Alignment.centerLeft,
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          tilePadding: EdgeInsets.zero,
          title: Text(
            AppTextsEnglish.More_information.tr,
            textAlign: Get.find<MyAppServices>().appIsArabic()
                ? TextAlign.right
                : TextAlign.left,
            style: TextStyle(
              fontSize: AppConstants.val_12,
              color: AppColor.black,
              fontWeight: FontWeight.w500,
              fontFamily: Get.find<MyAppServices>().appIsArabic()
                  ? AppFonts.cairo
                  : AppFonts.montserrat,
            ),
          ),
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.val_20,
                vertical: AppConstants.val_15,
              ),
              decoration: const BoxDecoration(
                borderRadius: AppBorderRadius.borderRadius_10,
              ),
              child: OrderDrugsDetailsBody(orderModel: orderModel),
            ),
          ],
        ),
      ),
    );
  }
}
