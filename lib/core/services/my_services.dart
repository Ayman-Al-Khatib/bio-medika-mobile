import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/services/cart_storage.dart';
import 'package:bio_medika/core/services/notification_storage.dart';
import 'package:bio_medika/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyAppServices extends GetxService {
  late Box<String?> _information;

  Future<MyAppServices> initialize() async {
    final appServices = MyAppServices();
    appServices._information = await Hive.openBox(AppTextsEnglish.Bio_Medika);
    return appServices;
  }

  bool appIsArabic() {
    return getValue(AppTextsEnglish.direction) == AppTextsEnglish.rtl;
  }

  bool appISNotificationsActive() {
    return getValue(AppTextsEnglish.Notification, defaultValue: 'true') ==
        'true';
  }

  Future<void> putValue(String key, String? value) async {
    await _information.put(key, value);
  }

  String getValue(String key, {String defaultValue = ''}) {
    return _information.get(key, defaultValue: defaultValue) ?? '';
  }

  Future<void> removeValue(String key) async {
    await _information.delete(key);
  }
}

Future<void> initializeServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Get.putAsync<MyAppServices>(
      () async => await MyAppServices().initialize());
  await CartStorage().initialize();
  await NotificationStorage().initialize();
}
