import 'package:auto_size_text/auto_size_text.dart';
import 'package:bio_medika/core/constant/app_border_radius.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/helpers/get_name.dart';
import 'package:bio_medika/core/navigation/app_routes.dart';
import 'package:bio_medika/models/medication_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomPopularItem extends StatelessWidget {
  final MedicationModel medicationModel;
  final String label;
  final (Color, Color, String) infoDes;
  const CustomPopularItem({
    super.key,
    required this.medicationModel,
    required this.label,
    required this.infoDes,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        NavigationService.drugDetails(argument: {
          'medicationModel': medicationModel,
          'tag': '${medicationModel.imageUrl}2'
        });
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.val_10, vertical: 10),
            decoration: BoxDecoration(
              color: infoDes.$1,
              borderRadius: AppBorderRadius.borderRadius_20,
            ),
            width: size.width * 0.25,
            height: size.width * 0.22,
            child: Hero(
              tag: '${medicationModel.imageUrl}2',
              child: CachedNetworkImage(
                imageUrl: medicationModel.imageUrl,
                placeholder: (context, url) => Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: size.width * 0.10,
                        maxWidth: size.width * 0.10),
                    child: const CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  size: AppConstants.val_28,
                  color: infoDes.$2,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppConstants.val_4),
          SizedBox(
            height: AppConstants.val_14,
            width: size.width * 0.264,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AutoSizeText(
                getTextLang(
                    nameEnglish: medicationModel.commercialNameEn,
                    nameArabic: medicationModel.commercialNameAr),
                maxLines: 2,
                maxFontSize: AppConstants.val_12,
                minFontSize: AppConstants.val_4,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: AppConstants.val_12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
