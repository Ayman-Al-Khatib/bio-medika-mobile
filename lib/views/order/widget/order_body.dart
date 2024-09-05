import 'package:bio_medika/controllers/order_controller.dart';
import 'package:bio_medika/core/constant/app_border_radius.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/enum/type_widget.dart';
import 'package:bio_medika/core/ui/components/handling_data.dart';
import 'package:bio_medika/core/ui/shared/shimmer.dart';
import 'package:bio_medika/views/order/widget/order_item/order_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderBody extends StatelessWidget {
  const OrderBody({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<OrderControllerImp>(
      builder: (controller) {
        return RequestStatusHandler(
          addList: true,
          statusRequest: controller.statusRequest,
          loading: false,
          child: ShimmerBioMedica(
            borderRadius: AppBorderRadius.borderRadius_20,
            height: size.height / AppConstants.val_4,
            padding: const EdgeInsets.only(
                left: AppConstants.val_18, right: AppConstants.val_18),
            space: AppConstants.val_18,
            width: double.infinity,
            typeWidget: TypeWidget.column,
            loading: controller.statusRequest == StatusRequest.loading,
            child: ListView.builder(
              itemCount: controller.listOrder.length,
              itemBuilder: (context, index) {
                return index != controller.listOrder.length - 1
                    ? OrderItem(orderModel: controller.listOrder[index])
                    : Column(
                        children: [
                          OrderItem(orderModel: controller.listOrder[index]),
                          const SizedBox(height: AppConstants.val_78),
                        ],
                      );
              },
            ),
          ),
        );
      },
    );
  }
}
