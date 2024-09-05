import 'package:bio_medika/controllers/account_info_controller.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/enum/type_pick.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountInfoButtonPickImage
    extends GetView<AccountInformationControllerImp> {
  const AccountInfoButtonPickImage({
    required this.typePick,
    required this.imagPath,
    required this.title,
    super.key,
  });
  final TypePick typePick;
  final String imagPath;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: AppConstants.val_18),
        InkWell(
          onTap: () async {
            await controller.pickImage(typePick);
          },
          child: Image.asset(
            imagPath,
            height: AppConstants.val_60,
            fit: BoxFit.fill,
            width: AppConstants.val_60,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: AppColor.black,
            fontSize: AppConstants.val_12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppConstants.val_30),
      ],
    );
  }
}
