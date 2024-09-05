import 'package:bio_medika/controllers/tiny_tasks/up_image_and_name_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OpenImage extends GetView<UpImageAndNameControllerImp> {
  const OpenImage({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Image.network(
          controller.userModel.imageUrl!,
          width: size.width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
