import 'package:bio_medika/controllers/cart_controller.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/views/cart/widget/cart_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/app_colors.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    final size = MediaQuery.sizeOf(context);
    return GetBuilder<CartControllerImp>(builder: (controller) {
      return Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: controller.active
                    ? AppConstants.val_16
                    : AppConstants.val_0),
            child: const CartBody(),
          ),
          if (controller.active)
            Container(
                width: size.width,
                color: AppColor.noColor,
                child: const Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                        height: AppConstants.val_7,
                        child: LinearProgressIndicator())))
        ],
      );
    });
  }
}
