import 'package:bio_medika/controllers/auth/reset_password_controller.dart';
import 'package:bio_medika/views/auth/widget/reset_password/confirmation_back_dialogs.dart';
import 'package:bio_medika/views/auth/widget/reset_password/reset_password_body.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return const PopScope(
      canPop: false,
      onPopInvoked: showConfirmationDialog,
      child: Scaffold(
        body: ResetPasswordBody(),
      ),
    );
  }
}
