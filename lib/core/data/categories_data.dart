import 'package:bio_medika/core/services/app_link.dart';
import 'package:bio_medika/core/services/crud.dart';
import 'package:bio_medika/models/response_data.dart';

class CategoryData {
  Crud crud;
  CategoryData(this.crud);

  Future<ResponseData> getCategory() async {
    return await crud.getData(linkUrl: AppLink.category, token: true);
  }
}
