import 'package:bio_medika/views/auth/widget/forget_password/forget_password_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth/forget_password_controller.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return const Scaffold(
      body: ForgetPasswordBody(),
    );
  }
}
