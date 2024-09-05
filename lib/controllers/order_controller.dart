import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/data/order_data.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/models/order_model.dart';
import 'package:bio_medika/models/response_data.dart';
import 'package:get/get.dart';

abstract class OrderController extends GetxController {
  void changeIsExpanded(bool expanded);
  Future<void> getAllOrder();
  Future<bool> cancelOrder(OrderModel orderModel);
  void search(String query);
}

class OrderControllerImp extends OrderController {
  bool isExpanded = false;
  late OrderData orderData;
  late StatusRequest statusRequest;
  late List<OrderModel> listOrder;
  late List<OrderModel> fullOrder;

  @override
  changeIsExpanded(bool expanded) {
    isExpanded = expanded;
    update();
  }

  @override
  Future<void> getAllOrder() async {
    statusRequest = StatusRequest.loading;
    update();
    listOrder.clear();
    ResponseData responseData = await orderData.getAllOrder();
    statusRequest = responseData.statusRequest;
    if (responseData.statusRequest == StatusRequest.success) {
      fullOrder = listOrder =
          OrderModel.listFromJson(responseData.data).reversed.toList();
    }
    update();
  }

  @override
  Future<bool> cancelOrder(OrderModel orderModel) async {
    ResponseData responseData = await orderData.cancelOrder(orderModel.id);

    if (responseData.statusRequest == StatusRequest.success) {

      //! remove
      orderModel.status = AppTextsEnglish.Cancelled;
      update();
      //! remove
      return true;
    }
    return false;
  }

  @override
  void search(String query) async {
    listOrder = fullOrder.where((element) {
      return element.paid == query ||
          element.status == query ||
          query == AppTextsEnglish.All_orders;
    }).toList();
    if (listOrder.isEmpty) {
      statusRequest = StatusRequest.empty;
    } else {
      statusRequest = StatusRequest.success;
    }
    update();
    Get.back();
  }

  @override
  void onInit() async {
    orderData = OrderData(Get.find());
    statusRequest = StatusRequest.loading;
    listOrder = fullOrder = [];
    await getAllOrder();
    super.onInit();
  }
}
