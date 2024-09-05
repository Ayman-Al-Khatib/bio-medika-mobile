import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/services/my_services.dart';

import 'package:bio_medika/models/notificatoin_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NotificationStorage extends GetxService {
  late Box<NotificationModel> _notificationStorage;
  static final NotificationStorage _instance = NotificationStorage._internal();

  NotificationStorage._internal();

  factory NotificationStorage() => _instance;

  Future<void> initialize() async {
    Hive.registerAdapter(NotificationModelAdapter());
    _notificationStorage =
        await Hive.openBox<NotificationModel>(AppTextsEnglish.Notifications);
  }

  Future<void> addListNotifications(List<NotificationModel> list) async {
    for (int i = 0; i < list.length; i++) {
      Get.find<MyAppServices>().putValue(
          'NotificationID',
          ((int.tryParse(Get.find<MyAppServices>()
                          .getValue('NotificationID', defaultValue: '0')) ??
                      0) +
                  1)
              .toString());

      int id = int.tryParse(Get.find<MyAppServices>()
              .getValue('NotificationID', defaultValue: '0')) ??
          0;
      list[i].id = id;
      await _notificationStorage.put(id, list[i]);
    }
  }

  Future<void> addNotification(NotificationModel notificationModel) async {
    await _notificationStorage.put(notificationModel.id, notificationModel);
  }

  NotificationModel getValue(String key) {
    return _notificationStorage.get(key,
        defaultValue: NotificationModel(
            id: 0,
            titleAr: 'titleAr',
            titleEn: 'titleEn',
            bodyAr: 'bodyAr',
            bodyEn: 'bodyEn',
            date: 'date',
            type: 'type'))!;
  }

  List<NotificationModel> getAll() {
    var list = _notificationStorage.values.toList();
    list.sort((a, b) => b.id.compareTo(a.id));
    return list;
  }

  Future<void> removeValue(int key) async {
    await _notificationStorage.delete(key);
  }

  Future<void> removeAll() async {
    await _notificationStorage.clear();
  }

  int getNotificationsLength() {
    return _notificationStorage.length;
  }
}
