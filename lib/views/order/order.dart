import 'package:bio_medika/controllers/order_controller.dart';
import 'package:bio_medika/views/order/widget/order_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Order extends StatelessWidget {
  const Order({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OrderControllerImp());
    return RefreshIndicator(
      onRefresh: () => Get.find<OrderControllerImp>().getAllOrder(),
      child: const OrderBody(),
    );
  }
}
