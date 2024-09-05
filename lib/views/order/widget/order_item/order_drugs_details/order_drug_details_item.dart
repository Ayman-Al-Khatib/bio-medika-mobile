import 'package:bio_medika/core/constant/app_border_radius.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/views/order/widget/order_item/order_drugs_details/order_drugs_details_intex_item.dart';
import 'package:bio_medika/views/order/widget/order_item/order_drugs_details/order_drugs_details_row_info.dart';
import 'package:bio_medika/views/order/widget/order_item/order_drugs_details/order_drugs_details_total_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDrugsDetailsItem extends StatelessWidget {
  const OrderDrugsDetailsItem({
    super.key,
    required this.index,
    required this.name,
    required this.discount,
    required this.price,
    required this.quantity,
    required this.totalPrice,
  });
  final String index;
  final String name;
  final String discount;
  final String price;
  final String quantity;
  final String totalPrice;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(AppConstants.val_12),
          decoration: BoxDecoration(
              borderRadius: AppBorderRadius.borderRadius_10,
              color: AppColor.white.withOpacity(0.4)),
          child: Column(
            children: [
              OrderDrugsDetailsItemRowInfo(
                  prefic: AppTextsEnglish.Name.tr, suffix: name),
              OrderDrugsDetailsItemRowInfo(
                  prefic: AppTextsEnglish.Quantity.tr, suffix: quantity),
              OrderDrugsDetailsItemRowInfo(
                  prefic: AppTextsEnglish.Discount.tr, suffix: discount),
              OrderDrugsDetailsItemRowInfo(
                  prefic: AppTextsEnglish.Price.tr, suffix: price),
              const Divider(
                  height: AppConstants.val_0, color: AppColor.primary),
              const SizedBox(height: AppConstants.val_4),
              OrderDrugsDetailsItemTotalPrice(totalPrice: totalPrice)
            ],
          ),
        ),
        OrderDrugsDetailsItemIndexItem(index: index),
      ],
    );
  }
}
