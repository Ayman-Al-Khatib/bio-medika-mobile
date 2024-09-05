import 'package:bio_medika/controllers/cart_controller.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItemCustomButton extends GetView<CartControllerImp> {
  const CartItemCustomButton({
    required this.onTap,
    required this.onLongPress,
    super.key,
    required this.icon,
  });
  final IconData icon;
  final void Function() onTap;
  final void Function() onLongPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      onLongPressUp: () => controller.timer.cancel(),
      child: CircleAvatar(
        backgroundColor: AppColor.background,
        radius: AppConstants.val_11,
        child: Icon(
          icon,
          size: AppConstants.val_17,
          color: AppColor.primary,
        ),
      ),
    );
  }
}
