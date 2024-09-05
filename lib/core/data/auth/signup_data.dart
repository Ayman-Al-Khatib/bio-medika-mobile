import 'package:bio_medika/core/services/app_link.dart';
import 'package:bio_medika/core/services/crud.dart';
import 'package:bio_medika/models/response_data.dart';

class SingupData {
  Crud crud;
  SingupData(this.crud);

  Future<ResponseData> postData(Map<String, String> map) async {
    return await crud.postData(linkUrl: AppLink.signup, data: map);
  }
}
