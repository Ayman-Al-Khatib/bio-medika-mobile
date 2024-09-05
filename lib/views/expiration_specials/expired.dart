import 'package:bio_medika/controllers/expired_controller.dart';
import 'package:bio_medika/views/expiration_specials/widget/expired_body.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Expired extends StatelessWidget {
  const Expired({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ExpiredControllerImp());
    return const Scaffold(resizeToAvoidBottomInset: false, body: ExpiredBody());
  }
}
