import 'package:bio_medika/controllers/drug_details_controller.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuantityButton extends GetView<DrugDetailsControllerImp> {
  final IconData icon;
  final VoidCallback onPressed;
  final VoidCallback onLongPress;
  final Radius left, right;
  const QuantityButton({
    required this.icon,
    required this.onPressed,
    required this.onLongPress,
    required this.left,
    required this.right,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      onLongPressUp: () {
        controller.timer.cancel();
      },
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: controller.infoDes.$1,
          elevation: AppConstants.val_0,
          shadowColor: controller.infoDes.$1,
          padding: EdgeInsets.zero,
          foregroundColor: controller.infoDes.$2,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: controller.infoDes.$2,
              width: 1.5,
            ),
            borderRadius: BorderRadius.horizontal(
              left: left,
              right: right,
            ),
          ),
        ),
        child: Icon(
          icon,
          color: controller.infoDes.$2,
          size: AppConstants.val_26,
        ),
      ),
    );
  }
}
