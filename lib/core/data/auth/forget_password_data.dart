import 'package:bio_medika/core/services/app_link.dart';
import 'package:bio_medika/core/services/crud.dart';
import 'package:bio_medika/models/response_data.dart';

class ForgetPasswordData {
  Crud crud;
  ForgetPasswordData(this.crud);

  Future<ResponseData> sendCode({required String email}) async {
    return await crud
        .postData(linkUrl: AppLink.sendCode, data: {"email": email});
  }
}
