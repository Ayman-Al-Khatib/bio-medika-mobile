import 'package:auto_size_text/auto_size_text.dart';
import 'package:bio_medika/core/constant/app_border_radius.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:flutter/material.dart';

class OrderStatusItem extends StatelessWidget {
  const OrderStatusItem({
    super.key,
    required this.typeStatus,
    required this.status,
    required this.backgroundColor,
    required this.color,
  });
  final String typeStatus;
  final String status;
  final Color backgroundColor;
  final Color color;
  @override
  Widget build(BuildContext context) {
    bool isSmall = MediaQuery.of(context).size.width < 380;
    return Row(
      children: [
        AutoSizeText(
          maxLines: 2,
          maxFontSize: isSmall ? AppConstants.val_9 : AppConstants.val_11,
          minFontSize: AppConstants.val_6,
          typeStatus,
          style: const TextStyle(
              fontSize: AppConstants.val_11, fontWeight: FontWeight.w600),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: AppConstants.val_2,
            horizontal: AppConstants.val_6,
          ),
          decoration: BoxDecoration(
              borderRadius: AppBorderRadius.borderRadius_6,
              color: backgroundColor),
          child: AutoSizeText(
            maxLines: 1,
            maxFontSize: isSmall ? AppConstants.val_8 : AppConstants.val_9,
            minFontSize: AppConstants.val_6,
            status,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: AppConstants.val_9,
            ),
          ),
        ),
      ],
    );
  }
}
