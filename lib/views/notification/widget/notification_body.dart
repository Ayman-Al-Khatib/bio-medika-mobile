import 'package:bio_medika/controllers/notification_controller.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/views/notification/widget/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationControllerImp>(builder: (controller) {
      return ListView.builder(
        itemCount: controller.listNotifications.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: index == controller.listNotifications.length - 1
                    ? AppConstants.val_78
                    : AppConstants.val_0),
            child: NotificationItem(
                notificationModel: controller.listNotifications[index]),
          );
        },
      );
    });
  }
}

// List<NotificationItem> notifications = [
//   // const NotificationItem(
//   //   title: 'Order Received',
//   //   body: 'Your order has been successfully received.',
//   //   icon: Icons.info_outline,
//   //   color: AppColor.notificationItemBlue,
//   // ),
//   // const NotificationItem(
//   //   title: 'Order Paid',
//   //   body: 'Payment for your order has been processed.',
//   //   icon: Icons.check_circle_outline,
//   //   color: AppColor.notificationItemGreen,
//   // ),
//   // const NotificationItem(
//   //   title: 'Order Cancelled',
//   //   body: 'Your order has been cancelled. Contact support for assistance.',
//   //   icon: Icons.warning_amber,
//   //   color: AppColor.notificationItemOrange,
//   // ),
//   const NotificationItem(
//     title: 'Order Deleted',
//     body: 'Your order has been deleted. Contact support for further details.',
//     icon: Icons.error_outline,
//     color: AppColor.notificationItemRed,
//   ),
//   const NotificationItem(
//     title: 'Shipment Dispatched',
//     body: 'Your order is on its way. Please be available at the specified location.',
//     icon: Icons.info_outline,
//     color: AppColor.notificationItemBlue,
//   ),
//   const NotificationItem(
//     title: 'Order Delivered',
//     body: 'Congratulations! Your order has been successfully delivered.',
//     icon: Icons.check_circle_outline,
//     color: AppColor.notificationItemGreen,
//   ),
//   const NotificationItem(
//     title: 'Payment Failed',
//     body: 'Payment for your order has failed. Please update your payment method.',
//     icon: Icons.warning_amber,
//     color: AppColor.notificationItemOrange,
//   ),
//   const NotificationItem(
//     title: 'Order Update',
//     body: 'Important update regarding your order. Check your account for details.',
//     icon: Icons.error_outline,
//     color: AppColor.notificationItemRed,
//   ),
//   const NotificationItem(
//     title: 'Welcome New Customer',
//     body: 'A warm welcome to our new customer: [Name].',
//     icon: Icons.check_circle_outline,
//     color: AppColor.notificationItemGreen,
//   ),
//   const NotificationItem(
//     title: 'Training Workshop Reminder',
//     body: 'Reminder: Training workshop on [topic] starts soon. Be prepared!',
//     icon: Icons.check_circle_outline,
//     color: AppColor.notificationItemGreen,
//   ),
// ];

// // Use the notifications list as needed in your application
