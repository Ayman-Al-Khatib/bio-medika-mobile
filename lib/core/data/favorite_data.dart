import 'package:bio_medika/core/services/app_link.dart';
import 'package:bio_medika/core/services/crud.dart';
import 'package:bio_medika/models/response_data.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

  Future<ResponseData> addFavorite(String id) async {
    return await crud
        .postData(linkUrl: AppLink.addFavorite, token: true, data: {"id": id});
  }

  Future<ResponseData> removeFavorite(String id) async {
    return await crud.postData(
        linkUrl: AppLink.removeFavorite, token: true, data: {"id": id});
  }

  Future<ResponseData> getFavorite() async {
    return await crud.getData(linkUrl: AppLink.getFavorite, token: true);
  }
}
