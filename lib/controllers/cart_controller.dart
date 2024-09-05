import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bio_medika/controllers/drug_controller.dart';
import 'package:bio_medika/controllers/expired_controller.dart';
import 'package:bio_medika/controllers/homa_page_controller.dart';
import 'package:bio_medika/controllers/main_screen_controller.dart';
import 'package:bio_medika/controllers/order_controller.dart';
import 'package:bio_medika/controllers/tiny_tasks/up_image_and_name_controller.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/data/drugs_data.dart';
import 'package:bio_medika/core/data/order_data.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/helpers/get_color_category.dart';
import 'package:bio_medika/core/navigation/app_routes.dart';
import 'package:bio_medika/core/services/cart_storage.dart';
import 'package:bio_medika/core/ui/shared/snacbar_widget.dart';
import 'package:bio_medika/models/cart_model.dart';
import 'package:bio_medika/models/medication_model.dart';
import 'package:bio_medika/models/order_model.dart';
import 'package:bio_medika/models/response_data.dart';
import 'package:bio_medika/models/user_model.dart';
import 'package:bio_medika/views/cart/widget/not_enough_medication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  void getAllCart();
  String totalPriceForAllCart();

  void removeCart(CartModel cartModel);
  Future<void> addOrRemoveOne({bool isAdd = true, required CartModel cartModel});
  Future<void> addContinuous({bool isAdd = true, required CartModel cartModel});
  String totalPrice(CartModel cartModel);
  void orderNow();
  Map<String, dynamic> convertCartModelListToJson();
}

class CartControllerImp extends CartController {
  late CartStorage cartStorage;
  late List<CartModel> listCart;
  late StatusRequest statusRequest;
  late Timer timer;
  late OrderData orderData;
  late DrugsData drugsData;
  bool active = false;
  @override
  Future<void> getAllCart() async {
    listCart.clear();
    statusRequest = StatusRequest.loading;
    update();
    listCart = await cartStorage.getAll();
    if (listCart.isEmpty) {
      statusRequest = StatusRequest.empty;
    } else {
      statusRequest = StatusRequest.success;
    }
    update();
  }

  @override
  void onInit() async {
    listCart = [];
    cartStorage = CartStorage();
    orderData = OrderData(Get.find());
    drugsData = DrugsData(Get.find());
    getAllCart();
    cartStorage.updateCartUI(() async {
      await getAllCart();
      if (CartStorage().getCartLength() == 0) {
        Get.find<MainScreenControllerImp>().update();
        statusRequest = StatusRequest.empty;
      } else {
        statusRequest = StatusRequest.success;
      }

      update();
    });
    statusRequest = StatusRequest.none;
    super.onInit();
  }

  @override
  void removeCart(CartModel cartModel) async {
    await cartModel.delete();
  }

  @override
  Future<void> addContinuous({bool isAdd = true, required CartModel cartModel}) async {
    timer = Timer.periodic(const Duration(milliseconds: 100), (Timer t) async {
      await addOrRemoveOne(isAdd: isAdd, cartModel: cartModel);
    });
  }

  @override
  Future<void> addOrRemoveOne({bool isAdd = true, required CartModel cartModel}) async {
    if (cartModel.quantity == 1 && isAdd == false) return;

    cartModel.quantity += isAdd ? 1 : -1;
    await cartModel.save();
    update();
  }

  @override
  String totalPrice(CartModel cartModel) {
    double total = cartModel.finalPrice * cartModel.quantity;
    if (total.toString().split('.')[1].length > 1 && total.toString().split('.')[1][1] != '0') {
      return total.toStringAsFixed(2);
    }
    return total.toStringAsFixed(1);
  }

  @override
  String totalPriceForAllCart() {
    double total = 0.0;
    for (int i = 0; i < listCart.length; i++) {
      total += listCart[i].finalPrice * listCart[i].quantity;
    }
    if (total.toString().split('.')[1].length > 1 && total.toString().split('.')[1][1] != '0') {
      return total.toStringAsFixed(2);
    }
    return total.toStringAsFixed(1);
  }

  @override
  Map<String, dynamic> convertCartModelListToJson() {
    Map<String, dynamic> jsonMap = {
      "details": listCart.map((cartItem) {
        return {"medication_id": int.tryParse(cartItem.id) ?? 0, "quantity": cartItem.quantity};
      }).toList()
    };

    return jsonMap;
  }

  @override
  Future<void> orderNow() async {
    await AwesomeDialog(
            padding: const EdgeInsets.symmetric(horizontal: AppConstants.val_14),
            context: Get.context!,
            dialogType: DialogType.info,
            animType: AnimType.bottomSlide,
            title: AppTextsEnglish.new_Order.tr,
            desc:
                "${AppTextsEnglish.The_total_price_of_the_products_ordered_is.tr}: ${totalPriceForAllCart()}",
            titleTextStyle: const TextStyle(
              fontSize: AppConstants.val_17,
              fontWeight: FontWeight.w600,
            ),
            descTextStyle: const TextStyle(
              fontSize: AppConstants.val_14,
              fontWeight: FontWeight.w500,
            ),
            btnCancelText: AppTextsEnglish.cancel.tr,
            btnOkText: AppTextsEnglish.Ok.tr,
            btnCancelOnPress: () {},
            dismissOnBackKeyPress: false,
            dismissOnTouchOutside: false,
            btnOkOnPress: _btnOkOnPress)
        .show();
  }

  _btnOkOnPress() async {
    if (UserModel.isAddressFound()) {
      active = true;
      update();
      Map<String, dynamic> cart = convertCartModelListToJson();
      ResponseData responseData = await orderData.careateOrder(data: cart);

      if (responseData.statusRequest == StatusRequest.success) {
        for (int index = 0; index < listCart.length; index++) {
          if (Get.isRegistered<HomaePageControllerImp>()) {
            final controller = Get.find<HomaePageControllerImp>();

            for (var i = 0; i < controller.listDailySale.length; i++) {
              if (controller.listDailySale[i].id.toString() == listCart[index].id) {
                controller.listDailySale[i].quantity -= listCart[index].quantity;
                break;
              }
            }
            for (var i = 0; i < controller.listMostPopular.length; i++) {
              if (controller.listMostPopular[i].id.toString() == listCart[index].id) {
                controller.listMostPopular[i].quantity -= listCart[index].quantity;
                break;
              }
            }

            for (var i = 0; i < controller.fullMedication.length; i++) {
              if (controller.fullMedication[i].id.toString() == listCart[index].id) {
                controller.fullMedication[i].quantity -= listCart[index].quantity;
                break;
              }
            }
            controller.listMedication = controller.fullMedication;
          }

          if (Get.isRegistered<ExpiredControllerImp>()) {
            final controller = Get.find<ExpiredControllerImp>();

            for (var i = 0; i < controller.fullData.length; i++) {
              if (controller.fullData[i].id.toString() == listCart[index].id) {
                controller.fullData[i].quantity -= listCart[index].quantity;
                break;
              }
            }
            controller.listDrug = controller.fullData;
          }
          if (Get.isRegistered<DrugControllerImp>()) {
            final controller = Get.find<DrugControllerImp>();

            for (var i = 0; i < controller.fullData.length; i++) {
              if (controller.fullData[i].id.toString() == listCart[index].id) {
                controller.fullData[i].quantity -= listCart[index].quantity;
                break;
              }
            }
            controller.listDrug = controller.fullData;
          }
        }

        statusRequest = StatusRequest.empty;
        listCart.clear();
        CartStorage().removeAll();
        if (Get.isRegistered<OrderControllerImp>()) {
          final controller = Get.find<OrderControllerImp>();
          controller.fullOrder.insert(0, OrderModel.fromJson(responseData.data));
          controller.listOrder = controller.fullOrder;
          controller.update();
        }

        showCustomSnackbar(
          snackPosition: SnackPosition.TOP,
          title: AppTextsEnglish.Your_order_is_being_prepared.tr,
          message: AppTextsEnglish.You_can_follow_the_status_of_your_order_from_your_orders_page.tr,
          backgroundGradient: const LinearGradient(
            colors: [AppColor.profilePackground_2, AppColor.primary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: AppConstants.val_15,
          duration: const Duration(milliseconds: 2500),
        ).then((value) {});
        active = false;
      } else if (responseData.statusRequest == StatusRequest.serverFailure &&
          responseData.errors['notEnough'] != null) {
        await AwesomeDialog(
          padding: const EdgeInsets.symmetric(horizontal: AppConstants.val_14),
          context: Get.context!,
          dialogType: DialogType.noHeader,
          animType: AnimType.bottomSlide,
          title: AppTextsEnglish.Excuse_me.tr,
          desc: AppTextsEnglish.Review_quantities_for_selected_items_Modify_or_await_restock.tr,
          titleTextStyle: const TextStyle(
            fontSize: AppConstants.val_17,
            fontWeight: FontWeight.w600,
          ),
          descTextStyle: const TextStyle(
            fontSize: AppConstants.val_14,
            fontWeight: FontWeight.w500,
          ),
          body: NotEnoughMedication(
            data: responseData.errors['notEnough'],
          ),
          btnCancelText: AppTextsEnglish.cancel.tr,
          btnOkText: AppTextsEnglish.Ok.tr,
        ).show();
        active = false;
        update();
      } else {
        await showCustomSnackbar(
          snackPosition: SnackPosition.TOP,
          title: AppTextsEnglish.Error.tr,
          message: responseData.errors,
          backgroundGradient: const LinearGradient(
            colors: [AppColor.redAccent, AppColor.pinkAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: AppConstants.val_15,
          duration: const Duration(seconds: 4),
        ).then((value) {
          update();
        });
        active = false;
        update();
      }
    } else {
      await AwesomeDialog(
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.val_14),
        context: Get.context!,
        dialogType: DialogType.noHeader,
        animType: AnimType.bottomSlide,
        title: AppTextsEnglish.Profile_Incomplete.tr,
        desc: AppTextsEnglish
            .Please_complete_your_profile_with_your_address_information_to_proceed_with_the_order.tr,
        titleTextStyle: const TextStyle(
          fontSize: AppConstants.val_17,
          fontWeight: FontWeight.w600,
        ),
        descTextStyle: const TextStyle(
          fontSize: AppConstants.val_14,
          fontWeight: FontWeight.w500,
        ),
        btnCancelOnPress: () {},
        btnOkOnPress: () {
          if (!Get.isRegistered<UpImageAndNameControllerImp>()) {
            Get.put(UpImageAndNameControllerImp());
          }
          NavigationService.accountInformation();
        },
        btnCancelText: AppTextsEnglish.cancel.tr,
        btnOkText: AppTextsEnglish.Ok.tr,
      ).show();

      //   await showCustomSnackbar(
      //     title: AppTextsEnglish.Profile_Incomplete.tr,
      //     message: AppTextsEnglish
      //         .Please_complete_your_profile_with_your_address_information_to_proceed_with_the_order.tr,
      //     backgroundGradient: const LinearGradient(
      //       colors: [AppColor.redAccent, AppColor.pinkAccent],
      //       begin: Alignment.topLeft,
      //       end: Alignment.bottomRight,
      //     ),
      //     borderRadius: AppConstants.val_15,
      //     duration: const Duration(seconds: 4),
      //   ).then((value) {
      //     update();
      //   });
      active = false;
      update();
    }
  }

  getOneDrug(String id) async {
    ResponseData responseData = await drugsData.getOneDrugs(id: id);
    if (responseData.statusRequest == StatusRequest.success) {
      MedicationModel medicationModel = MedicationModel.fromJson(responseData.data);
      await NavigationService.drugDetails(
          argument: {"medicationModel": medicationModel, "infoDes": getColorCategory(0)});
    }
    if (responseData.statusRequest == StatusRequest.failure) {
      await showCustomSnackbar(
        title: AppTextsEnglish.Error.tr,
        message: responseData.errors,
        backgroundGradient: const LinearGradient(
          colors: [AppColor.redAccent, AppColor.pinkAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: AppConstants.val_15,
        duration: const Duration(seconds: 4),
      ).then((value) {});
    }
    update();
  }
}
