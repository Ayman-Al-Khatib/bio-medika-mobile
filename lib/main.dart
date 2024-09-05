import 'package:bio_medika/controllers/locale_controller.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/localization/translations/my_translation.dart';
import 'package:bio_medika/core/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/bindings/app_bindings.dart';
import 'core/services/my_services.dart';

void main() async {
  await initializeServices();

  runApp(const BioMedika());
}

class BioMedika extends StatelessWidget {
  const BioMedika({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      initialBinding: AppBindings(),
      debugShowCheckedModeBanner: false,
      title: AppTextsEnglish.Bio_Medika.tr,
      theme: controller.appTheme,
      translations: MyTranslation(),
      locale: controller.language,
      getPages: route,
    );
  }
}
