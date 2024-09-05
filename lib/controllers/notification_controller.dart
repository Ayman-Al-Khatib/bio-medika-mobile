import 'package:bio_medika/core/data/notification_data.dart';
import 'package:bio_medika/core/helpers/pc.dart';
import 'package:bio_medika/core/services/notification_storage.dart';
import 'package:bio_medika/models/notificatoin_model.dart';
import 'package:bio_medika/models/response_data.dart';
import 'package:get/get.dart';

import '../core/enum/status_request_enum.dart';

abstract class NotificationController extends GetxController {
  getNotifications();
  void removeNotifications(int id);
}

class NotificationControllerImp extends NotificationController {
  late StatusRequest statusRequest;
  late List<NotificationModel> listNotifications;
  late NotificationData notificationData;

  @override
  Future<void> getNotifications() async {
    statusRequest = StatusRequest.loading;
    update();
    ResponseData responseData = await notificationData.getNotifications();
    statusRequest = StatusRequest.success;
    if (responseData.statusRequest == StatusRequest.success) {
      await NotificationStorage().addListNotifications(
          NotificationModel.listFromJson(
                  responseData.data['unreadNotifications'])
              .reversed
              .toList());
    }
    listNotifications = NotificationStorage().getAll();
    pc(listNotifications.length.toString());
    update();
  }

  @override
  void removeNotifications(int id) {
    listNotifications.removeWhere((element) => element.id == id);
    NotificationStorage().removeValue(id);
    update();
  }

  @override
  void onInit() async {
    statusRequest = StatusRequest.none;
    listNotifications = [];
    notificationData = NotificationData(Get.find());
    getNotifications();
    super.onInit();
  }
}
