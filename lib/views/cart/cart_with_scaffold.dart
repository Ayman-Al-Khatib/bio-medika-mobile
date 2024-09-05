import 'package:bio_medika/controllers/cart_controller.dart';
import 'package:bio_medika/core/constant/app_assets_svg.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_fonts.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:bio_medika/core/utils/show_image_svg.dart';
import 'package:bio_medika/views/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartWithScaffold extends GetView<CartControllerImp> {
  const CartWithScaffold({super.key});
  @override
  Widget build(BuildContext context) {
    bool isArabic = Get.find<MyAppServices>().appIsArabic();
    return Scaffold(
      appBar: AppBar(
        actions: [
          GetBuilder<CartControllerImp>(builder: (controller) {
            return Visibility(
              visible: controller.listCart.isNotEmpty,
              child: Padding(
                padding: EdgeInsets.only(
                  right: isArabic ? AppConstants.val_10 : AppConstants.val_10,
                  left: !isArabic ? AppConstants.val_10 : AppConstants.val_10,
                ),
                child: IconButton(
                  onPressed: () {
                    controller.orderNow();
                  },
                  icon: const ShowImageSvg(
                    path: AppAssetsSvg.cartPlus,
                    color: AppColor.iconAndTextGrey,
                  ),
                ),
              ),
            );
          }),
        ],
        centerTitle: true,
        surfaceTintColor: AppColor.background,
        backgroundColor: AppColor.background,
        title: Text(
          AppTextsEnglish.Cart.tr,
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColor.primary,
              fontFamily: AppFonts.amiri),
        ),
      ),
      body: const Cart(),
    );
  }
}
