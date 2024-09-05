import 'package:bio_medika/controllers/tiny_tasks/up_image_and_name_controller.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserName extends StatelessWidget {
  const UserName({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        top: size.width * 0.35 +
            size.height * 0.05 +
            AppConstants.val_45 +
            AppConstants.val_14,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<UpImageAndNameControllerImp>(builder: (controller) {
            return Text(
              controller.userModel.name,
              style: const TextStyle(
                  fontSize: AppConstants.val_20,
                  fontWeight: FontWeight.w600,
                  color: AppColor.background,
                  shadows: [
                    Shadow(
                        color: AppColor.profilePackground_2,
                        blurRadius: AppConstants.val_6,
                        offset: Offset(AppConstants.val_0, AppConstants.val_2)),
                    Shadow(
                        color: AppColor.primary,
                        blurRadius: AppConstants.val_6,
                        offset:
                            Offset(AppConstants.val_0, -AppConstants.val_2)),
                  ]),
            );
          }),
        ],
      ),
    );
  }
}
