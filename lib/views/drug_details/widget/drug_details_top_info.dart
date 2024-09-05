import 'package:auto_size_text/auto_size_text.dart';
import 'package:bio_medika/controllers/drug_details_controller.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/helpers/get_name.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrugDetailsTopInfo extends GetView<DrugDetailsControllerImp> {
  const DrugDetailsTopInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isArabic = Get.find<MyAppServices>().appIsArabic();
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        top: size.height * 0.2,
        left: !isArabic ? size.width * 0.1 : 0,
        right: isArabic ? size.width * 0.1 : 0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width * 0.8,
            child: AutoSizeText(
              maxLines: 1,
              maxFontSize: AppConstants.val_40,
              minFontSize: AppConstants.val_10,
              getTextLang(
                  nameEnglish: controller.medicationModel.commercialNameEn,
                  nameArabic: controller.medicationModel.commercialNameAr),
              style: const TextStyle(
                fontSize: AppConstants.val_50,
                color: AppColor.background,
                fontWeight: FontWeight.bold,
                height: 0.8,
              ),
            ),
          ),
          const SizedBox(height: AppConstants.val_4),
          if (isArabic) const SizedBox(height: AppConstants.val_10),
          Text(
            "${AppTextsEnglish.Available_quantity_is.tr}: ${controller.medicationModel.quantity} ${AppTextsEnglish.pieces.tr}",
            style: const TextStyle(
              fontSize: AppConstants.val_10,
              color: AppColor.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (isArabic) const SizedBox(height: AppConstants.val_2),
          Text(
            getTextLang(
                nameEnglish:
                    '${AppTextsEnglish.company_name.tr} ${controller.medicationModel.companyNameEn}',
                nameArabic:
                    '${AppTextsEnglish.company_name.tr} ${controller.medicationModel.companyNameAr}'),
            style: const TextStyle(
              fontSize: AppConstants.val_10,
              color: AppColor.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (isArabic) const SizedBox(height: AppConstants.val_2),
          Text(
            getTextLang(
                nameEnglish:
                    '${AppTextsEnglish.scientific_name.tr} ${controller.medicationModel.scientificNameEn}',
                nameArabic:
                    '${AppTextsEnglish.scientific_name.tr} ${controller.medicationModel.scientificNameAr}'),
            style: const TextStyle(
              fontSize: AppConstants.val_10,
              color: AppColor.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (isArabic) const SizedBox(height: AppConstants.val_2),
          Text(
            getTextLang(
                nameEnglish:
                    '${AppTextsEnglish.Expiry_date.tr}: ${controller.medicationModel.expiryDate}',
                nameArabic:
                    '${AppTextsEnglish.Expiry_date.tr}: ${controller.medicationModel.expiryDate}'),
            style: const TextStyle(
              fontSize: AppConstants.val_10,
              color: AppColor.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (isArabic) const SizedBox(height: AppConstants.val_2),
          Text(
            "${AppTextsEnglish.Price.tr}: ${controller.medicationModel.finalPrice}\$",
            style: const TextStyle(
              fontSize: AppConstants.val_10,
              color: AppColor.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          GetBuilder<DrugDetailsControllerImp>(builder: (controller) {
            return Text(
              "${AppTextsEnglish.Cart.tr}: ${controller.cartStorage.getValue(controller.medicationModel.id.toString()).quantity} ${AppTextsEnglish.pieces.tr}",
              style: const TextStyle(
                fontSize: AppConstants.val_10,
                color: AppColor.white,
                fontWeight: FontWeight.bold,
              ),
            );
          }),
        ],
      ),
    );
  }
}
