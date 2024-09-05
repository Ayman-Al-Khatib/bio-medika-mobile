import 'package:bio_medika/controllers/order_controller.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:bio_medika/models/order_model.dart';
import 'package:bio_medika/views/order/widget/order_item/order_item_body.dart';
import 'package:flutter/material.dart';
import 'package:bio_medika/core/constant/app_border_radius.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class OrderItem extends GetView<OrderControllerImp> {
  const OrderItem({super.key, required this.orderModel});
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
  final bool isArabic =Get.find<MyAppServices>().appIsArabic();
    return Slidable(
      enabled: orderModel.status == AppTextsEnglish.Pending,
      startActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) async {
              await controller.cancelOrder(orderModel);
            },
            backgroundColor: AppColor.noColor,
            foregroundColor: AppColor.secondary,
            padding:   EdgeInsets.only(

                right: isArabic?AppConstants.val_24:0,
                left:! isArabic?AppConstants.val_24:0
            ),
            icon: Icons.cancel_outlined,
            label: AppTextsEnglish.cancel.tr,
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: AppConstants.val_20, vertical: AppConstants.val_5),
        padding: const EdgeInsets.only(
            top: AppConstants.val_18,
            left: AppConstants.val_18,
            right: AppConstants.val_18),
        decoration: BoxDecoration(
            color: AppColor.primary.withOpacity(0.2),
            border: Border.all(
              color: AppColor.primary,
              width: 1.2,
              strokeAlign: -AppConstants.val_5,
            ),
            borderRadius: AppBorderRadius.borderRadius_20),
        child: OrderItemBody(
          orderModel: orderModel,
        ),
      ),
    );
  }
}
