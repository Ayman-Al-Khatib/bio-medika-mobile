import 'package:bio_medika/controllers/main_screen_controller.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/ui/components/custom_appbar.dart';
import 'package:bio_medika/core/ui/components/exit_confirmation_dialog.dart';
import 'package:bio_medika/views/mian_screen/widget/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MainScreenControllerImp());
    return GetBuilder<MainScreenControllerImp>(builder: (controller) {
      return PopScope(
        canPop: false,
        onPopInvoked: (bool value) {
          showExitConfirmationDialog(value);
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColor.background,
            appBar: CustomAppBar(
                title: controller.titleAppBar[controller.currentPage]),
            body: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                        child: controller.listPage
                            .elementAt(controller.currentPage))
                  ],
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: CurvedNavigationBarWidget(
                        onTap: controller.changePage)),
              ],
            )),
      );
    });
  }
}
