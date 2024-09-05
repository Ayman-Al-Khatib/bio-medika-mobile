import 'package:bio_medika/controllers/cart_controller.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/ui/components/handling_data.dart';
import 'package:bio_medika/views/cart/widget/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListItems extends StatelessWidget {
  const CartListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(builder: (controller) {
      return RequestStatusHandler(
        statusRequest: controller.statusRequest,
        loading: true,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.listCart.length,
          itemBuilder: (context, index) {
            return index != controller.listCart.length - 1
                ? CartItem(cartModel: controller.listCart[index])
                : Column(
                    children: [
                      CartItem(cartModel: controller.listCart[index]),
                      const SizedBox(
                          height: AppConstants.val_78 - AppConstants.val_10),
                    ],
                  );
          },
        ),
      );
    });
  }
}
