import 'package:bio_medika/controllers/account_info_controller.dart';
import 'package:bio_medika/views/account_info/widget/account_info_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/app_colors.dart';

class AccountInformation extends StatelessWidget {
  const AccountInformation({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AccountInformationControllerImp());
    return const Scaffold(
      backgroundColor: AppColor.secondary,
      body: AccountInformationBody(),
    );
  }
}
