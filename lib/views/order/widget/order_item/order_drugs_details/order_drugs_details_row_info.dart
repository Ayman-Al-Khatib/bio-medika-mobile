import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:flutter/material.dart';

class OrderDrugsDetailsItemRowInfo extends StatelessWidget {
  const OrderDrugsDetailsItemRowInfo({
    super.key,
    required this.prefic,
    required this.suffix,
  });
  final String prefic, suffix;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppConstants.val_5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            prefic,
            style: const TextStyle(
              fontSize: AppConstants.val_12,
              color: AppColor.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            suffix,
            style: const TextStyle(
              fontSize: AppConstants.val_12,
              color: AppColor.black,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
