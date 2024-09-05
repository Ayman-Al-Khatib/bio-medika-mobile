import 'package:bio_medika/core/services/app_link.dart';

class MedicationModel {
  late String id;
  late String categoryId;
  late String scientificNameAr;
  late String scientificNameEn;
  late String commercialNameAr;
  late String commercialNameEn;
  late String companyNameAr;
  late String companyNameEn;
  late String detailsAr;
  late String detailsEn;
  late double price;
  late int quantity;
  late String expiryDate;
  late String imageUrl;
  late String createdAt;
  late String updatedAt;
  late int daysBeforeExpiration;
  late int monthsBeforeExpiration;
  late int dailySale;
  late int sale;
  late bool favorate;

  late double finalPrice;

  MedicationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    categoryId = json['category_id'].toString();
    scientificNameAr = json['scientific_name_ar'];
    scientificNameEn = json['scientific_name_en'];
    commercialNameAr = json['commercial_name_ar'];
    commercialNameEn = json['commercial_name_en'];
    companyNameAr = json['company_name_ar'];
    companyNameEn = json['company_name_en'];
    detailsAr = json['details_ar'];
    detailsEn = json['details_en'];
    price = double.tryParse(json['price'].toString()) ?? 0;
    quantity = int.tryParse(json['quantity'].toString()) ?? 0;
    expiryDate = json['expiry_date'].toString();
    imageUrl = AppLink.prefixPathImage + json['image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    daysBeforeExpiration = json['days_before_expiration'] ?? 0;
    monthsBeforeExpiration = json['months_before_expiration'] ?? 0;
    dailySale = json['daily_sale'] ?? 0;
    sale = json['sale'] ?? 0;
    finalPrice = double.tryParse(json['final_price'].toString()) ?? 0.0;
    favorate = json['favorite'] ?? true;
  }

  static List<MedicationModel> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => MedicationModel.fromJson(json)).toList();
  }
}
