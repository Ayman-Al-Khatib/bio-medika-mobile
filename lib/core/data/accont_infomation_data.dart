import 'dart:io';

import 'package:bio_medika/core/services/app_link.dart';
import 'package:bio_medika/core/services/crud.dart';
import 'package:bio_medika/models/response_data.dart';

class AccountInformationData {
  Crud crud;
  AccountInformationData(this.crud);

  Future<ResponseData> updateInformationWithImage(
      Map<String, dynamic> data, File? image, fieldName) async {
    return await crud.postWithImageData(
      linkUrl: AppLink.accountInformation,
      data: data,
      image: image,
      fieldName: fieldName,
      token: true,
    );
  }
}
