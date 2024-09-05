import 'package:bio_medika/controllers/auth/login_controller.dart';

import 'package:bio_medika/views/auth/widget/login/login_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bio_medika/core/ui/components/exit_confirmation_dialog.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return const Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: showExitConfirmationDialog,
        child: LoginBody(),
      ),
    );
  }
}
