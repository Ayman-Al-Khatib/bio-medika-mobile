import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/models/cart_model.dart';
import 'package:bio_medika/models/medication_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartStorage extends GetxService {
  late Box<CartModel> _cartStorage; // Use CartModel as the type
  static final CartStorage _instance = CartStorage._internal();

  CartStorage._internal();

  factory CartStorage() => _instance;

  void updateCartUI(Function function) {
    _cartStorage.watch().listen((event) {
      function();
    });
  }

  Future<void> initialize() async {
    Hive.registerAdapter(CartModelAdapter());
    _cartStorage = await Hive.openBox<CartModel>(AppTextsEnglish.Cart);
  }

  Future<void> addCart(CartModel data) async {
    CartModel cartModel = getValue(data.id.toString());
    if (cartModel.id != '-1') {
      data = data..quantity = data.quantity + cartModel.quantity;
      if (data.quantity < 0) return;
      await _cartStorage.put(data.id.toString(), data);
    } else {
      await _cartStorage.put(data.id.toString(), data);
    }
  }

  Future<void> addCartFromMedication(MedicationModel data, int quantity) async {
    await addCart(CartModel(
      id: data.id.toString(),
      price: data.price,
      sale: data.sale.toDouble(),
      finalPrice: data.finalPrice,
      quantity: quantity,
      image: data.imageUrl,
      nameAr: data.commercialNameAr,
      nameEn: data.commercialNameEn,
    ));
  }

  CartModel getValue(String key) {
    return _cartStorage.get(
      key,
      defaultValue: CartModel(
          id: '-1',
          price: 0.0,
          sale: 0.0,
          finalPrice: 0.0,
          quantity: 0,
          image: '',
          nameAr: '',
          nameEn: ''),
    )!;
  }

  Future<List<CartModel>> getAll() async {
    return _cartStorage.values.toList();
  }

  Future<void> removeValue(String key) async {
    await _cartStorage.delete(key);
  }

  Future<void> removeAll() async {
    await _cartStorage.clear();
  }

  int getCartLength() {
    return _cartStorage.length;
  }
}
