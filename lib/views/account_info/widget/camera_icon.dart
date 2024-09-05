import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bio_medika/core/constant/app_assets_png.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/enum/type_pick.dart';
import 'package:bio_medika/views/account_info/widget/account_info_button_pick_image.dart';
import 'package:flutter/material.dart';

class CameraIcon extends StatelessWidget {
  const CameraIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * 0.12,
      right: AppConstants.val_2,
      child: Container(
        padding: const EdgeInsets.all(AppConstants.val_2 + 0.5),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(AppConstants.val_100)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColor.primary,
              AppColor.profilePackground_2,
            ],
          ),
        ),
        child: CircleAvatar(
          backgroundColor: AppColor.white,
          radius: AppConstants.val_12,
          child: InkWell(
            onTap: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.noHeader,
                body: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AccountInfoButtonPickImage(
                        typePick: TypePick.camera,
                        imagPath: AppAssetsPng.camera,
                        title: AppTextsEnglish.Camera),
                    AccountInfoButtonPickImage(
                        typePick: TypePick.gallery,
                        imagPath: AppAssetsPng.gallery,
                        title: AppTextsEnglish.Gallery),
                  ],
                ),
              ).show();
            },
            child: const Icon(
              Icons.camera_alt_outlined,
              size: AppConstants.val_16,
              color: AppColor.primary,
            ),
          ),
        ),
      ),
    );
  }
}
