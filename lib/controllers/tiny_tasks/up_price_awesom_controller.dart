import 'package:bio_medika/core/services/cart_storage.dart';
import 'package:bio_medika/models/medication_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AwesomeController extends GetxController {
  addToCart(MedicationModel medicationModel);
  String totalPrice(MedicationModel medicationModel);
}

class AwesomeControllerImp extends AwesomeController {
  late TextEditingController quantity;
  late CartStorage cartStorage;
  @override
  addToCart(MedicationModel medicationModel) async {
    await cartStorage.addCartFromMedication(
        medicationModel, int.tryParse(quantity.text) ?? 1);
    quantity.text = '1';
  }

  @override
  String totalPrice(MedicationModel medicationModel) {
    double total =
        medicationModel.finalPrice * (double.tryParse(quantity.text) ?? 1);
    if (total.toString().split('.')[1].length > 1 &&
        total.toString().split('.')[1][1] != '0') {
      return total.toStringAsFixed(2);
    }
    return total.toStringAsFixed(1);
  }

  @override
  void onInit() {
    quantity = TextEditingController(text: '1');
    quantity.addListener(() {
      update();
    });
    cartStorage = CartStorage();
    super.onInit();
  }
}
