import 'dart:convert';

import 'package:bio_medika/controllers/drug_controller.dart';
import 'package:bio_medika/controllers/expired_controller.dart';
import 'package:bio_medika/controllers/homa_page_controller.dart';
import 'package:bio_medika/controllers/notification_controller.dart';
import 'package:bio_medika/controllers/order_controller.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/models/medication_model.dart';
import 'package:bio_medika/models/order_model.dart';
import 'package:bio_medika/models/user_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

abstract class FirebaseController extends GetxController {
  void init();
  void addOrder(OrderModel orderModel);
  void addMedication(MedicationModel medicationModel);
  void updateOrder({required String id, String? status, String? paid});
  void addSale();
}

class FirebaseControllerImp extends FirebaseController {
  @override
  void addOrder(OrderModel orderModel) {
    if (Get.isRegistered<OrderControllerImp>()) {
      // final controller = Get.find<OrderControllerImp>();
      // controller.fullOrder.insert(0, orderModel);
      // controller.listOrder = controller.fullOrder;
      // controller.statusRequest = StatusRequest.success;
      // controller.update();
    }
  }

  @override
  void addSale() async {
    if (Get.isRegistered<HomaePageControllerImp>()) {
      final controller = Get.find<HomaePageControllerImp>();
      await controller.getDailySale();
      controller.update();
    }
  }

  @override
  void updateOrder({required String id, String? status, String? paid}) {
    if (Get.isRegistered<OrderControllerImp>()) {
      final controller = Get.find<OrderControllerImp>();
      for (int i = 0; i < controller.fullOrder.length; i++) {
        if (controller.fullOrder[i].id.toString() == id) {
          controller.fullOrder[i].status =
              status ?? controller.fullOrder[i].status;
          controller.fullOrder[i].paid = paid ?? controller.fullOrder[i].paid;
        }
      }
      for (int i = 0; i < controller.listOrder.length; i++) {
        if (controller.listOrder[i].id.toString() == id) {
          controller.listOrder[i].status =
              status ?? controller.listOrder[i].status;
          controller.listOrder[i].paid = paid ?? controller.listOrder[i].paid;
        }
      }
      controller.update();
    }
  }

  @override
  void addMedication(MedicationModel medicationModel) {
    medicationModel.favorate = false;

    if (Get.isRegistered<HomaePageControllerImp>()) {
      final controller = Get.find<HomaePageControllerImp>();
      controller.fullMedication.add(medicationModel);
      controller.listMedication = controller.fullMedication;
      controller.searchController.text = '';
      controller.lastSearch = null;
      controller.statusRequest = StatusRequest.success;
      controller.update();
    }
    if (Get.isRegistered<ExpiredControllerImp>()) {
      final controller = Get.find<ExpiredControllerImp>();

      controller.fullData.add(medicationModel);
      controller.listDrug = controller.fullData;
      controller.searchController.text = '';
      controller.lastSearch = null;
      controller.statusRequest = StatusRequest.success;

      controller.update();
    }
    if (Get.isRegistered<DrugControllerImp>()) {
      final controller = Get.find<DrugControllerImp>();
      if (controller.categoriesModel.id.toString() ==
          medicationModel.categoryId) {
        controller.fullData.add(medicationModel);
        controller.listDrug = controller.fullData;
        controller.searchController.text = '';
        controller.lastSearch = null;
        controller.statusRequest = StatusRequest.success;

        controller.update();
      }
    }
  }

  handelNotificaton(Map<String, dynamic> message) {
    if (Get.isRegistered<NotificationControllerImp>()) {
      Get.find<NotificationControllerImp>().getNotifications();
      Get.find<NotificationControllerImp>().update();
    }
    if (message['type'] == 'createOrder') {
      addOrder(OrderModel.fromJson(message['model'][0]));
    }

    //!

    else if (message['type'] == 'shippedOrder' ||
        message['type'] == 'deliveredOrder' 
       ) {
      updateOrder(
          id: '${message['model']['id']}',
          status: message['model']['status'],
          paid: null);
    }

    //!

    else if (message['type'] == 'paidOrder') {
      updateOrder(
          id: message['model']['id'].toString(),
          status: null,
          paid: message['model']['paid']);
    }

    //!

    else if (message['type'] == 'createSale') {
      addSale();
    } else if (message['type'] == 'createMedication') {
      addMedication(MedicationModel.fromJson(message['model'][0]));
    }
  }

  requestPermissionNotification() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  @override
  void init() {
    requestPermissionNotification();
    FirebaseMessaging.instance.subscribeToTopic(UserModel.get().id);
    FirebaseMessaging.instance.subscribeToTopic("user");
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // pc('-------------------------1');
      // pc(message.data.toString());
      // pc('-------------------------2');

      // // pc(json.decode(json.encode(message.data.toString())));

      // pc('-------------------------3');
      // pc(jsonDecode(message.data.toString())["info"].toString());
      // pc('-------------------------4');

      handelNotificaton(json.decode(message.data.toString())["info"]);
    });
  }
}
