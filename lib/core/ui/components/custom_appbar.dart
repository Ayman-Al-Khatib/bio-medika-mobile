import 'package:bio_medika/controllers/main_screen_controller.dart';
import 'package:bio_medika/controllers/order_controller.dart';
import 'package:bio_medika/core/constant/app_assets_svg.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_fonts.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/services/cart_storage.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:bio_medika/core/utils/show_image_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    bool isArabic = Get.find<MyAppServices>().appIsArabic();
    return AppBar(
      actions: [
        GetBuilder<MainScreenControllerImp>(builder: (controller) {
          return Visibility(
            visible: controller.currentPage == AppConstants.val_2,
            child: Padding(
              padding: EdgeInsets.only(
                right: isArabic ? AppConstants.val_10 : AppConstants.val_10,
                left: !isArabic ? AppConstants.val_10 : AppConstants.val_10,
              ),
              child: IconButton(
                onPressed: () {
                  controller.goToProfile();
                },
                icon: const ShowImageSvg(
                  path: AppAssetsSvg.profile,
                  color: AppColor.iconAndTextGrey,
                ),
              ),
            ),
          );
        }),
        GetBuilder<MainScreenControllerImp>(builder: (controller) {
          return Visibility(
            visible: controller.currentPage == AppConstants.val_3 &&
                CartStorage().getCartLength() != 0,
            child: Padding(
              padding: EdgeInsets.only(
                right: isArabic ? AppConstants.val_10 : AppConstants.val_10,
                left: !isArabic ? AppConstants.val_10 : AppConstants.val_10,
              ),
              child: IconButton(
                onPressed: () {
                  controller.addOrder();
                },
                icon: const ShowImageSvg(
                  path: AppAssetsSvg.cartPlus,
                  color: AppColor.iconAndTextGrey,
                ),
              ),
            ),
          );
        }),
        GetBuilder<MainScreenControllerImp>(builder: (controller) {
          return Visibility(
            visible: controller.currentPage == AppConstants.val_1,
            child: PopupMenuButton<String>(
              onSelected: (value) {},
              itemBuilder: (BuildContext context) {
                return [
                  _buildMenuItem(
                      AppTextsEnglish.All_orders, Icons.all_inclusive),
                  _divider(),
                  _buildMenuItem(AppTextsEnglish.Pending, Icons.access_time),
                  _buildMenuItem(
                      AppTextsEnglish.Shipped, Icons.local_shipping_outlined),
                  _buildMenuItem(
                      AppTextsEnglish.Delivered, Icons.check_circle_outline),
                  _buildMenuItem(
                      AppTextsEnglish.Cancelled, Icons.cancel_outlined),
                  _divider(),
                  _buildMenuItem(
                      AppTextsEnglish.Paid, Icons.attach_money_outlined),
                  _buildMenuItem(
                      AppTextsEnglish.Unpaid, Icons.money_off_csred_outlined),
                ];
              },
            ),
          );
        }),
      ],
      surfaceTintColor: AppColor.background,
      backgroundColor: AppColor.background,
      title: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColor.primary,
            fontFamily: AppFonts.amiri),
      ),
      centerTitle: true,
    );
  }

  PopupMenuItem<String> _divider() {
    return const PopupMenuItem<String>(
      height: 0,
      enabled: false,
      child: Divider(
        height: AppConstants.val_0,
      ),
    );
  }

  PopupMenuItem<String> _buildMenuItem(String value, IconData icon) {
    return PopupMenuItem<String>(
      value: value,
      child: ListTile(
        onTap: () => Get.find<OrderControllerImp>().search(value),
        textColor: AppColor.black,
        trailing: Icon(icon, color: AppColor.primary),
        leading: Text(value.tr, style: const TextStyle(fontSize: 12)),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
