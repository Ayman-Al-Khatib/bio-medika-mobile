import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

(Color, IconData) getNotificationColorAndIcon(String type) {
  if (type == 'createOrder') {
    return (AppColor.notificationItemBlue, Icons.info_outline);
  } else if (type == 'cancelOrder') {
    return (AppColor.notificationItemRed, Icons.error_outline);
  } else if (type == 'deliveredOrder') {
    return (AppColor.notificationItemGreen, Icons.check_circle_outline);
  } else if (type == 'shippedOrder') {
    return (AppColor.notificationItemOrange, Icons.warning_amber);
  } else if (type == 'createSale') {
    return (AppColor.notificationItemOrange, Icons.warning_amber);
  } else if (type == 'createMedication') {
    return (AppColor.notificationItemBlue, Icons.info_outline);
  } else {
    return (AppColor.notificationItemGreen, Icons.check_circle_outline);
  }
}
