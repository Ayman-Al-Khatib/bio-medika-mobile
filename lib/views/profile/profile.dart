import 'package:bio_medika/controllers/profile/profile_action_controller.dart';
import 'package:bio_medika/controllers/tiny_tasks/up_image_and_name_controller.dart';
import 'package:bio_medika/views/profile/widget/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/app_colors.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileActionController());
    if (!Get.isRegistered<UpImageAndNameControllerImp>()) {
      Get.put(UpImageAndNameControllerImp());
    }
    return const Scaffold(backgroundColor: AppColor.secondary, body: ProfileBody());
  }
}
