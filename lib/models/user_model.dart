import 'package:bio_medika/core/services/app_link.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:get/get.dart';

class UserModel {
  final String id;
  final String name;
  final String pharmacyName;
  final String email;
  final String phoneNumber;
  final String status;
  final String? imageUrl;
  final String city;
  final String street;
  final String landmark;
  final String district;
  final String token;

  UserModel({
    required this.id,
    required this.name,
    required this.pharmacyName,
    required this.email,
    required this.phoneNumber,
    required this.status,
    required this.imageUrl,
    required this.city,
    required this.street,
    required this.landmark,
    required this.district,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'].toString(),
      name: json['name'],
      pharmacyName: json['pharmacy_name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      status: json['status'],
      imageUrl: json['image_url'],
      city: json['city'] ?? "",
      street: json['street'] ?? "",
      landmark: json['landmark'] ?? "",
      district: json['district'] ?? "",
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'pharmacy_name': pharmacyName,
      'email': email,
      'phone_number': phoneNumber,
      'status': status,
      'image_url': imageUrl,
      'city': city,
      'street': street,
      'landmark': landmark,
      'district': district,
      'token': token,
    };
  }

  Future<UserModel> save() async {
    MyAppServices myAppServices = Get.find();
    await myAppServices.putValue('id', id.toString());
    await myAppServices.putValue('name', name);
    await myAppServices.putValue('pharmacyName', pharmacyName);
    await myAppServices.putValue('email', email);
    await myAppServices.putValue('phoneNumber', phoneNumber);
    await myAppServices.putValue('status', status);
    await myAppServices.putValue('city', city);
    await myAppServices.putValue('street', street);
    await myAppServices.putValue('landmark', landmark);
    await myAppServices.putValue('district', district);
    await myAppServices.putValue('imageUrl', imageUrl);
    await myAppServices.putValue('token', token);

    return get();
  }

  static UserModel get() {
    MyAppServices myAppServices = Get.find();
    String image = myAppServices.getValue('imageUrl');
    if (image == '') {
      image =
          'https://img.freepik.com/free-photo/doctor-white-suit-stand-futuristic-blue-background_1409-5084.jpg?t=st=1702917801~exp=1702921401~hmac=62358b304aae114b8859d15beed0af8eac06f092de014262b610febf98543858&w=900';
    } else {
      image = '${AppLink.prefixPathImage}$image';
    }
    return UserModel(
      id: myAppServices.getValue('id'),
      name: myAppServices.getValue('name'),
      pharmacyName: myAppServices.getValue('pharmacyName'),
      email: myAppServices.getValue('email'),
      phoneNumber: myAppServices.getValue('phoneNumber'),
      status: myAppServices.getValue('status'),
      imageUrl: image,
      city: myAppServices.getValue('city'),
      street: myAppServices.getValue('street'),
      landmark: myAppServices.getValue('landmark'),
      district: myAppServices.getValue('district'),
      token: myAppServices.getValue('token'),
    );
  }

  static bool isAddressFound() {
    MyAppServices myAppServices = Get.find();

    return myAppServices.getValue('token').isNotEmpty &&
        myAppServices.getValue('district').isNotEmpty &&
        myAppServices.getValue('landmark').isNotEmpty &&
        myAppServices.getValue('street').isNotEmpty;
  }

  static void clean() {
    MyAppServices myAppServices = Get.find();
    myAppServices.removeValue('id');
    myAppServices.removeValue('name');
    myAppServices.removeValue('pharmacyName');
    myAppServices.removeValue('email');
    myAppServices.removeValue('phoneNumber');
    myAppServices.removeValue('status');
    myAppServices.removeValue('city');
    myAppServices.removeValue('street');
    myAppServices.removeValue('landmark');
    myAppServices.removeValue('district');
    myAppServices.removeValue('imageUrl');
    myAppServices.removeValue('token');
  }
}
