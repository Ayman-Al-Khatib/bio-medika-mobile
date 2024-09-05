import 'package:bio_medika/core/services/app_link.dart';

class CategoriesModel {
  final int id;
  final String nameAr;
  final String nameEn;

  final String imageUrl;

  CategoriesModel({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.imageUrl,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['id'],
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
      imageUrl: AppLink.prefixPathImage + json['image_url'],
    );
  }

  static List<CategoriesModel> listFromJson(List jsonList) {
    return jsonList.map((json) => CategoriesModel.fromJson(json)).toList();
  }
}
