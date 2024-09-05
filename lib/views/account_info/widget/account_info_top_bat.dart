import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountInformationTopBar extends StatelessWidget {
  const AccountInformationTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.05),
      child: SizedBox(
        width: size.width,
        child: Row(
          children: [
            SizedBox(
              width: AppConstants.val_50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back, color: AppColor.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width - AppConstants.val_100,
              child: Text(
                AppTextsEnglish.Account_Information.tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: AppConstants.val_20,
                    fontWeight: FontWeight.w600,
                    color: AppColor.white,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            const SizedBox(
              width: AppConstants.val_50,
            ),
          ],
        ),
      ),
    );
  }
}
