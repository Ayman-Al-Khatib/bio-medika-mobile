import 'package:hive/hive.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartModel extends HiveObject {
  @HiveField(0)
  late String id;
  @HiveField(1)
  late double price;
  @HiveField(2)
  late double sale;
  @HiveField(3)
  late double finalPrice;
  @HiveField(4)
  late int quantity;
  @HiveField(5)
  late String image;
  @HiveField(6)
  late String nameAr;
  @HiveField(7)
  late String nameEn;
  CartModel({
    required this.id,
    required this.price,
    required this.sale,
    required this.finalPrice,
    required this.quantity,
    required this.image,
    required this.nameAr,
    required this.nameEn,
  });
}
