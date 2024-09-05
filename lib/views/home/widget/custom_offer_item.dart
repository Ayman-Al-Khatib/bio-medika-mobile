import 'package:auto_size_text/auto_size_text.dart';
import 'package:bio_medika/core/constant/app_assets_png.dart';
import 'package:bio_medika/core/constant/app_border_radius.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/helpers/get_name.dart';
import 'package:bio_medika/core/navigation/app_routes.dart';
import 'package:bio_medika/models/medication_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomOfferItemWidget extends StatelessWidget {
  final MedicationModel medicationModel;
  const CustomOfferItemWidget({
    super.key,
    required this.medicationModel,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        NavigationService.drugDetails(argument: {
          "medicationModel": medicationModel,
          'tag': '${medicationModel.imageUrl}1'
        });
      },
      child: Container(
        width: size.width * 0.4,
        height: AppConstants.val_90,
        decoration: const BoxDecoration(
          borderRadius: AppBorderRadius.borderRadius_20,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AppAssetsPng.backgroundItem),
          ),
        ),
        child: Row(
          children: [
            SizedBox(width: size.width * 0.4 * 0.06),
            Container(
              width: size.width * 0.4 * 0.45,
              padding:
                  const EdgeInsets.symmetric(vertical: AppConstants.val_12),
              child: Hero(
                tag: '${medicationModel.imageUrl}1',
                child: CachedNetworkImage(
                  imageUrl: medicationModel.imageUrl,
                  placeholder: (context, url) => const SizedBox(
                      child: CircleAvatar(
                    backgroundColor: AppColor.noColor,
                    child: CircularProgressIndicator(),
                  )),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    size: AppConstants.val_28,
                  ),
                ),
              ),
            ),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: size.width * 0.4 * 0.02),
              width: size.width * 0.4 * 0.43,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    maxLines: 1,
                    maxFontSize: AppConstants.val_18,
                    minFontSize: AppConstants.val_8,
                    getTextLang(
                        nameEnglish: medicationModel.commercialNameEn,
                        nameArabic: medicationModel.commercialNameAr),
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColor.white,
                    ),
                  ),
                  AutoSizeText(
                    maxLines: 1,
                    maxFontSize: AppConstants.val_18,
                    minFontSize: AppConstants.val_8,
                    '%${medicationModel.dailySale}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: size.width * 0.4 * 0.06),
          ],
        ),
      ),
    );
  }
}
