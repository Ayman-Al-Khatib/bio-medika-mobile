import 'package:bio_medika/core/services/app_link.dart';
import 'package:bio_medika/core/services/crud.dart';
import 'package:bio_medika/models/response_data.dart';

class OtpData {
  Crud crud;
  OtpData(this.crud);

  Future<ResponseData> checkCode(
      {required String email, required String code}) async {
    return await crud.postData(linkUrl: AppLink.checkCode, data: {
      "email": email,
      "code": code,
    });
  }
}
