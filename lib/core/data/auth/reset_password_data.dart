import 'package:bio_medika/core/services/app_link.dart';
import 'package:bio_medika/core/services/crud.dart';
import 'package:bio_medika/models/response_data.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);

  Future<ResponseData> resetPassword(
      {required String email,
      required String password,
      required String code}) async {
    return await crud.postData(
        linkUrl: AppLink.resetPassword,
        data: {"email": email, "password": password, "code": code});
  }
}
