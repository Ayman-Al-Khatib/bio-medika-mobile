import 'package:bio_medika/controllers/homa_page_controller.dart';
import 'package:bio_medika/core/ui/components/handling_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/widget/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomaePageControllerImp());
    return RefreshIndicator(
      onRefresh: () async {
        await controller.init();
      },
      child: GetBuilder<HomaePageControllerImp>(
        builder: (context) {
          return RequestStatusHandler(
            statusRequest: controller.statusRequest,
            addList: true,
            child: const HomePageBody(),
          );
        },
      ),
    );
  }
}
