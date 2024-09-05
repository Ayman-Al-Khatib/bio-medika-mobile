import 'package:bio_medika/controllers/cart_controller.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_fonts.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/helpers/get_name.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:bio_medika/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItemInfo extends GetView<CartControllerImp> {
  const CartItemInfo({
    super.key,
    required this.cartModel,
  });
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    bool isArabic = Get.find<MyAppServices>().appIsArabic();
    return Padding(
      padding: EdgeInsets.only(
        top: AppConstants.val_2,
        left: isArabic ? 0 : AppConstants.val_16,
        right: !isArabic ? 0 : AppConstants.val_16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            getTextLang(
                nameEnglish: cartModel.nameEn, nameArabic: cartModel.nameAr),
            style: const TextStyle(
              fontSize: AppConstants.val_18,
              height: 1,
              color: AppColor.background,
              fontWeight: FontWeight.bold,
              fontFamily: AppFonts.amiri,
            ),
          ),
          const SizedBox(height: AppConstants.val_6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${AppTextsEnglish.Price.tr}: ",
                style: const TextStyle(
                  height: 1,
                  fontSize: AppConstants.val_10,
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppConstants.val_2),
              Text(
                "${cartModel.finalPrice}\$",
                style: const TextStyle(
                  height: 1,
                  fontSize: AppConstants.val_10,
                  color: AppColor.background,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          const SizedBox(height: AppConstants.val_2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${AppTextsEnglish.totalPrice.tr}: ",
                style: const TextStyle(
                  height: 1,
                  fontSize: AppConstants.val_10,
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${controller.totalPrice(cartModel)}\$',
                style: const TextStyle(
                  height: 1,
                  fontSize: AppConstants.val_10,
                  color: AppColor.background,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
