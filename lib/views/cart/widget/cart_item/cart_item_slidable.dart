import 'package:bio_medika/controllers/cart_controller.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/models/cart_model.dart';
import 'package:bio_medika/views/cart/widget/cart_item/cart_item_child_slidable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class CartItemSlidable extends GetView<CartControllerImp> {
  const CartItemSlidable({
    super.key,
    required this.cartModel,
  });
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        extentRatio:
            0.3, // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              controller.removeCart(cartModel);
            },
            backgroundColor: AppColor.noColor,
            foregroundColor: AppColor.background,
            padding: EdgeInsets.zero,
            spacing: AppConstants.val_2,
            icon: Icons.delete,
            label: AppTextsEnglish.Delete.tr,
          ),
        ],
      ),
      child: CartItemChildSlidable(cartModel: cartModel),
    );
  }
}
