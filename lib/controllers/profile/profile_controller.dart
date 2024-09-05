import 'package:bio_medika/controllers/locale_controller.dart';
import 'package:bio_medika/controllers/main_screen_controller.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:bio_medika/models/user_model.dart';
import 'package:get/get.dart';

abstract class ProfileController extends GetxController {
  void toggleNotification();
  void toggleLanguage();
  void accountInformaiton();
  void myOrder();
  void favorite();
  void aboutAs();
  void logOut();
}

//! Note that this is abstract and cannot be instantiated

abstract class ProfileControllerImp extends ProfileController {
  late bool notifications;
  late bool languageIsArabic;
  late MyAppServices myAppServices;
  late LocaleController localeController;
  late MainScreenControllerImp mainScreenControllerImp;
  late StatusRequest statusRequest;
  late UserModel userModel;

  @override
  void onInit() {
    myAppServices = Get.find();
    notifications = myAppServices.appISNotificationsActive();
    languageIsArabic = myAppServices.appIsArabic();
    localeController = Get.find();
    mainScreenControllerImp = Get.find();
    statusRequest = StatusRequest.none;
    userModel = UserModel.get();
    super.onInit();
  }
}
