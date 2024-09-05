import 'package:bio_medika/controllers/cart_controller.dart';
import 'package:bio_medika/core/constant/app_assets_png.dart';
import 'package:bio_medika/core/constant/app_border_radius.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/models/cart_model.dart';
import 'package:bio_medika/views/cart/widget/cart_item/cart_item_slidable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartModel});
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () async =>
          await Get.find<CartControllerImp>().getOneDrug(cartModel.id),
      child: Stack(
        children: [
          Container(
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssetsPng.background1),
                fit: BoxFit.cover,
              ),
              borderRadius: AppBorderRadius.borderRadius_16,
            ),
            height: AppConstants.val_100,
            padding: const EdgeInsets.all(AppConstants.val_12),
            margin: const EdgeInsets.only(
              bottom: AppConstants.val_15,
              left: AppConstants.val_30,
              right: AppConstants.val_30,
            ),
            child: CartItemSlidable(cartModel: cartModel),
          ),
        ],
      ),
    );
  }
}
