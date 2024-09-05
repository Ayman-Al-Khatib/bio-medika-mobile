import 'package:auto_size_text/auto_size_text.dart';
import 'package:bio_medika/controllers/drug_details_controller.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/views/drug_details/widget/custom_add_to_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrugDetailsPrice extends GetView<DrugDetailsControllerImp> {
  const DrugDetailsPrice({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height - size.height * 0.075 - AppConstants.val_20,
      left: AppConstants.val_20,
      child: SizedBox(
        height: size.height * 0.075,
        width: size.width - AppConstants.val_40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.28,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '\$',
                    style: TextStyle(
                      fontSize: AppConstants.val_15,
                      color: controller.infoDes.$2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GetBuilder<DrugDetailsControllerImp>(builder: (controller) {
                    return Flexible(
                      child: AutoSizeText(
                        controller.totalPrice(),
                        maxLines: 1,
                        minFontSize: 0,
                        maxFontSize: AppConstants.val_40,
                        style: TextStyle(
                          height: 1.3,
                          fontSize: AppConstants.val_40,
                          color: controller.infoDes.$2,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
            const Spacer(),
            const AddToCartButton(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
