import 'package:bio_medika/controllers/cart_controller.dart';
import 'package:bio_medika/core/constant/app_border_radius.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/models/cart_model.dart';
import 'package:bio_medika/views/cart/widget/cart_item/cart_item_custom_button.dart';
import 'package:bio_medika/views/cart/widget/cart_item/cart_item_text_quantity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartitemQuantitySelector extends GetView<CartControllerImp> {
  const CartitemQuantitySelector({
    super.key,
    required this.cartModel,
  });
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstants.val_35,
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.borderRadius_10,
        color: AppColor.white.withOpacity(0.3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox.shrink(),
          CartItemCustomButton(
              icon: Icons.add,
              onTap: () async =>
                  await controller.addOrRemoveOne(cartModel: cartModel),
              onLongPress: () async =>
                  await controller.addContinuous(cartModel: cartModel)),
          CartItemTextQuantity(cartModel: cartModel),
          CartItemCustomButton(
            icon: Icons.remove,
            onTap: () async => await controller.addOrRemoveOne(
                cartModel: cartModel, isAdd: false),
            onLongPress: () async => await controller.addContinuous(
                cartModel: cartModel, isAdd: false),
          ),
          const SizedBox.shrink(),
        ],
      ),
    );
  }
}
