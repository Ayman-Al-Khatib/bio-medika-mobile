import 'package:bio_medika/core/services/app_link.dart';
import 'package:bio_medika/core/services/crud.dart';
import 'package:bio_medika/models/response_data.dart';

class DrugsData {
  Crud crud;
  DrugsData(this.crud);

  Future<ResponseData> getDrugs({required int id}) async {
    return await crud
        .postData(linkUrl: AppLink.drugCategory, token: true, data: {'id': id});
  }

  Future<ResponseData> getAllDrugs() async {
    return await crud.getData(linkUrl: AppLink.getAllMedication, token: true);
  }

  Future<ResponseData> getOneDrugs({required String id}) async {
    return await crud.postData(
        linkUrl: AppLink.getOneMedication, token: true, data: {'id': id});
  }

  Future<ResponseData> getUnderOneMonth() async {
    return await crud.getData(linkUrl: AppLink.underOneMonth, token: true);
  }

  Future<ResponseData> getUnderThreeMonth() async {
    return await crud.getData(linkUrl: AppLink.underThreeMonth, token: true);
  }

  Future<ResponseData> getmostPopular() async {
    return await crud.getData(linkUrl: AppLink.mostPopular, token: true);
  }

  Future<ResponseData> getDailySale() async {
    return await crud.getData(linkUrl: AppLink.dailySale, token: true);
  }
}
