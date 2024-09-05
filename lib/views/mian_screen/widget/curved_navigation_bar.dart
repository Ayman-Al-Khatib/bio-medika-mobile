import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/controllers/main_screen_controller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurvedNavigationBarWidget extends GetView<MainScreenControllerImp> {
  const CurvedNavigationBarWidget({super.key, required this.onTap});
  final void Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.noColor,
      padding: const EdgeInsets.only(top: AppConstants.val_18),
      child: CurvedNavigationBar(
        color: AppColor.secondary,
        backgroundColor: AppColor.noColor,
        buttonBackgroundColor: AppColor.primary,
        index: 2,
        height: AppConstants.val_60,
        items: [
          ...List<Widget>.generate(controller.imageButtonAppBar.length,
              (index) {
            bool isShow = controller.currentPage != index;
            double? width = !isShow ? AppConstants.val_30 : AppConstants.val_26;
            double? height =
                !isShow ? AppConstants.val_30 : AppConstants.val_26;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                    visible: isShow,
                    child: const SizedBox(height: AppConstants.val_12)),

                // ),
                Padding(
                  padding: EdgeInsets.all(isShow ? 0 : 1.5),
                  child: Image.asset(
                    controller.imageButtonAppBar[index],
                    width: width,
                    height: height,
                    color: AppColor.background,
                  ),
                ),
                //
                Visibility(
                  visible: isShow,
                  child: Text(
                    controller.titleButtonAppBar[index],
                    style: const TextStyle(
                        color: AppColor.background,
                        fontWeight: FontWeight.w600,
                        fontSize: 8),
                  ),
                )
              ],
            );
          })
        ],
        onTap: (index) async {
          onTap(index);
        },
      ),
    );
  }
}
