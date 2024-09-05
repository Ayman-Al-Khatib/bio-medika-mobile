import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/helpers/material_order.dart';
import 'package:bio_medika/views/order/widget/order_item/order_item_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus(
      {super.key, required this.paymentStatus, required this.orderStatus});
  final String paymentStatus;
  final String orderStatus;
  @override
  Widget build(BuildContext context) {
    MaterialOrderStatus order = MaterialOrderStatus(status: orderStatus);
    MaterialOrderStatus paid = MaterialOrderStatus(status: paymentStatus);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OrderStatusItem(
          backgroundColor: order.backgroundColor,
          color: order.itemColor,
          typeStatus: AppTextsEnglish.Order_status.tr,
          status: order.status,
        ),
        OrderStatusItem(
          backgroundColor: paid.backgroundColor,
          color: paid.itemColor,
          typeStatus: AppTextsEnglish.Payment_status.tr,
          status: paid.status,
        ),
      ],
    );
  }
}
