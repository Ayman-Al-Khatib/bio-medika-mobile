import 'package:bio_medika/controllers/auth/otp_controller.dart';
import 'package:bio_medika/views/auth/widget/otp/otp_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Otp extends StatelessWidget {
  const Otp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OtpControllerImp());
    return const Scaffold(
      body: OtpBody(),
    );
  }
}
