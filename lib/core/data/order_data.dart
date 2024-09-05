import 'package:bio_medika/core/services/app_link.dart';
import 'package:bio_medika/core/services/crud.dart';
import 'package:bio_medika/models/response_data.dart';

class OrderData {
  Crud crud;
  OrderData(this.crud);

  Future<ResponseData> careateOrder({required Map data}) async {
    return await crud.postData(
        linkUrl: AppLink.createOrder, token: true, data: data);
  }

  Future<ResponseData> getAllOrder() async {
    return await crud.postData(
      linkUrl: AppLink.getAllOrder,
      token: true,
    );
  }

  Future<ResponseData> cancelOrder(int id) async {
    return await crud
        .postData(linkUrl: AppLink.cancelOrder, token: true, data: {"id": id});
  }
}
