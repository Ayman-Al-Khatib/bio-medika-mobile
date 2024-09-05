import 'package:bio_medika/core/services/crud.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
