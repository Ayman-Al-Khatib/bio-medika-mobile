import 'package:bio_medika/controllers/auth/signup_controller.dart';
import 'package:bio_medika/views/auth/widget/signup/signup_body.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bio_medika/core/ui/components/exit_confirmation_dialog.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return const Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: showExitConfirmationDialog,
        child: SignUpBody(),
      ),
    );
  }
}
