import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:flutter/material.dart';

class OrderDrugsDetailsItemIndexItem extends StatelessWidget {
  const OrderDrugsDetailsItemIndexItem({
    super.key,
    required this.index,
  });
  final String index;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -AppConstants.val_7,
      left: -AppConstants.val_7,
      child: CircleAvatar(
        backgroundColor: AppColor.profilePackground_2,
        radius: AppConstants.val_12,
        child: Text(
          index,
          style: const TextStyle(
              color: AppColor.white, fontSize: AppConstants.val_12),
        ),
      ),
    );
  }
}
