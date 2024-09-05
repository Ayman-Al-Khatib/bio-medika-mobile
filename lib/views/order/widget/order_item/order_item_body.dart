import 'package:bio_medika/controllers/order_controller.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:bio_medika/models/order_model.dart';
import 'package:bio_medika/views/order/widget/order_item/order_item_date_section.dart';
import 'package:bio_medika/views/order/widget/order_item/order_item_info.dart';
import 'package:bio_medika/views/order/widget/order_item/order_section_status.dart';
import 'package:bio_medika/views/order/widget/order_item/order_drugs_details.dart';
import 'package:bio_medika/views/order/widget/order_item/order_totlal_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class OrderItemBody extends StatelessWidget {
  const OrderItemBody({
    super.key,
    required this.orderModel,
  });
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DateSection(dataTime: orderModel.createdAt),
          const SizedBox(height: AppConstants.val_6),
          GetBuilder<OrderControllerImp>(builder: (controller) {
            return OrderStatus(
              orderStatus: orderModel.status,
              paymentStatus: orderModel.paid,
            );
          }),

          const SizedBox(height: AppConstants.val_12),
          const Divider(height: AppConstants.val_0),
          const SizedBox(height: AppConstants.val_6),
          //
          OrderItemInfo(
              prefix: AppTextsEnglish.Number_of_drugs_required.tr,
              suffix: orderModel.medicationsCount.toString()),
          //
          const SizedBox(height: AppConstants.val_4),

          OrderItemInfo(
              isDate: orderModel.status == "Delivered",
              prefix: AppTextsEnglish.Received_date.tr,
              suffix: orderModel.status == "Delivered"
                  ? formatDate(orderModel.updatedAt)
                  : AppTextsEnglish.Not_delivered_yet.tr),

          OrderDrugsDetails(orderModel: orderModel),
          const SizedBox(height: AppConstants.val_6),
          const Divider(height: AppConstants.val_0),
          const SizedBox(height: AppConstants.val_2),
          OrderTotalPrice(totalPrice: '${orderModel.finalPrice}\$'),
          const SizedBox(height: AppConstants.val_4),
        ]);
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
