import 'package:bio_medika/core/services/app_link.dart';
import 'package:bio_medika/core/services/crud.dart';
import 'package:bio_medika/models/response_data.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  Future<ResponseData> postData(Map<String, String> map) async {
    return await crud.postData(linkUrl: AppLink.login, data: map);
  }
}
