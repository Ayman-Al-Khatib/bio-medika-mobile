import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/models/cart_model.dart';
import 'package:bio_medika/views/cart/widget/cart_item/cart_item_image.dart';
import 'package:bio_medika/views/cart/widget/cart_item/cart_item_quantity_selector.dart';
import 'package:bio_medika/views/cart/widget/cart_item/cart_item_info.dart';
import 'package:flutter/material.dart';

class CartItemChildSlidable extends StatelessWidget {
  const CartItemChildSlidable({
    super.key,
    required this.cartModel,
  });
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemImage(cartModel: cartModel),
        CartItemInfo(cartModel: cartModel),
        const Spacer(),
        CartitemQuantitySelector(cartModel: cartModel),
        const SizedBox(width: AppConstants.val_4),
      ],
    );
  }
}
