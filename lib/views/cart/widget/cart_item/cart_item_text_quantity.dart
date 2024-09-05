import 'package:auto_size_text/auto_size_text.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/models/cart_model.dart';
import 'package:flutter/material.dart';

class CartItemTextQuantity extends StatelessWidget {
  final CartModel cartModel;
  const CartItemTextQuantity({
    super.key,
    required this.cartModel,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.val_4),
      child: AutoSizeText(
        cartModel.quantity.toString(),
        maxLines: 1,
        maxFontSize: AppConstants.val_12,
        minFontSize: 1,
        style: const TextStyle(
          shadows: [
            BoxShadow(
              color: AppColor.primary,
              blurRadius: AppConstants.val_5,
              spreadRadius: AppConstants.val_5,
            ),
            BoxShadow(
              color: AppColor.pinkAccent,
              blurRadius: AppConstants.val_2,
              spreadRadius: AppConstants.val_2,
            ),
          ],
          color: AppColor.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
