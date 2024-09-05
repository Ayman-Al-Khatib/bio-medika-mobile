import 'package:bio_medika/core/constant/app_constant.dart';

import 'package:bio_medika/core/helpers/get_name.dart';
import 'package:bio_medika/models/order_model.dart';
import 'package:bio_medika/views/order/widget/order_item/order_drugs_details/order_drug_details_item.dart';
import 'package:flutter/material.dart';

class OrderDrugsDetailsBody extends StatelessWidget {
  const OrderDrugsDetailsBody({
    super.key,
    required this.orderModel,
  });
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: orderModel.details.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: index == 9 ? AppConstants.val_0 : AppConstants.val_14),
          child: OrderDrugsDetailsItem(
              index: '${index + 1}',
              name: getTextLang(
                  nameEnglish: orderModel.details[index].commercialNameEn,
                  nameArabic: orderModel.details[index].commercialNameAr),
              discount: '${orderModel.details[index].sale}%',
              price: orderModel.details[index].price.toString(),
              quantity: orderModel.details[index].quantity.toString(),
              totalPrice: orderModel.details[index].finalPrice.toString()),
        );
      },
    );
  }
}
