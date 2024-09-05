import 'package:bio_medika/controllers/notification_controller.dart';
import 'package:bio_medika/core/ui/components/handling_data.dart';
import 'package:bio_medika/views/notification/widget/notification_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notification extends StatelessWidget {
  const Notification({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(NotificationControllerImp());
    return GetBuilder<NotificationControllerImp>(builder: (controller) {
      return RefreshIndicator(
        onRefresh: () => controller.getNotifications(),
        child: RequestStatusHandler(
          statusRequest: controller.statusRequest,
          child: const NotificationBody(),
        ),
      );
    });
  }
}
