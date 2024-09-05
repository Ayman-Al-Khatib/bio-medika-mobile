import 'package:bio_medika/controllers/drug_details_controller.dart';
import 'package:bio_medika/core/constant/app_border_radius.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/ui/components/animation_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToCartButton extends GetView<DrugDetailsControllerImp> {
  const AddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MyAnimatedButton(
      pressEvent: controller.addToCart,
      icon: Icons.card_travel,
      text: AppTextsEnglish.add_to_cart.tr,
      color: AppColor.backgroundExpired,
      height: size.height * 0.075,
      width: size.width * 0.55,
      borderRadius: AppBorderRadius.borderRadius_14,
    );

    /*
     return InkWell(
      onTap: controller.addToCart,
      child: Container(
        padding: const EdgeInsets.all(AppConstants.val_14),
        height: size.height * 0.075,
        width: size.width * 0.55,
        decoration: BoxDecoration(
          borderRadius: AppBorderRadius.borderRadius_14,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              controller.infoDes.$2,
              controller.infoDes.$2,
              controller.infoDes.$2,
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AutoSizeText(
              maxLines: 1,
              minFontSize: 0,
              maxFontSize: AppConstants.val_18,
              AppTextsEnglish.add_to_cart.tr,
              style: const TextStyle(
                color: AppColor.background,
                fontWeight: FontWeight.bold,
                fontSize: AppConstants.val_18,
              ),
            ),
            const Icon(
              Icons.card_travel,
              color: AppColor.background,
              weight: AppConstants.val_2,
            ),
          ],
        ),
      ),
    );
    */
  }
}
