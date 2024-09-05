import 'package:bio_medika/models/user_model.dart';
import 'package:get/get.dart';

abstract class UpImageAndNameController extends GetxController {
  reset();
}

class UpImageAndNameControllerImp extends UpImageAndNameController {
  late UserModel userModel;
  @override
  reset() {
    userModel = UserModel.get();
    update();
  }

  @override
  void onInit() {
    userModel = UserModel.get();
    super.onInit();
  }
}
