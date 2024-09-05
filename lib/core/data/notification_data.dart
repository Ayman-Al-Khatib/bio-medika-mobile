import 'package:bio_medika/core/services/app_link.dart';
import 'package:bio_medika/core/services/crud.dart';
import 'package:bio_medika/models/response_data.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);

  Future<ResponseData> getNotifications() async {
    return await crud.getData(
      linkUrl: AppLink.getNotifications,
      token: true,
    );
  }
}
