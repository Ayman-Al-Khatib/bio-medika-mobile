import 'package:hive/hive.dart';

part 'notificatoin_model.g.dart';

@HiveType(typeId: 1)
class NotificationModel extends HiveObject {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String titleAr;
  @HiveField(2)
  late String titleEn;
  @HiveField(3)
  late String bodyAr;
  @HiveField(4)
  late String bodyEn;
  @HiveField(5)
  late String date;
  @HiveField(6)
  late String type;

  NotificationModel({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.bodyAr,
    required this.bodyEn,
    required this.date,
    required this.type,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: 0,
      titleAr: json['title_ar'],
      titleEn: json['title_en'],
      bodyAr: json['body_ar'],
      bodyEn: json['body_en'],
      date: json['created_at'],
      type: json['type'],
    );
  }
  static List<NotificationModel> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => NotificationModel.fromJson(json)).toList();
  }
}
