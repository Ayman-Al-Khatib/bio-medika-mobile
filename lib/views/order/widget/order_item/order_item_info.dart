import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:flutter/material.dart';

class OrderItemInfo extends StatelessWidget {
  final String prefix;
  final String suffix;
  final bool isDate;
  const OrderItemInfo({
    super.key,
    required this.prefix,
    required this.suffix,
    this.isDate = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppConstants.val_5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            prefix,
            style: const TextStyle(
              fontSize: AppConstants.val_12,
              color: AppColor.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            suffix,
            style: TextStyle(
                fontSize: AppConstants.val_12,
                color: AppColor.black,
                fontWeight: FontWeight.w500,
                fontFamily: isDate ? '-' : null),
          )
        ],
      ),
    );
  }
}
