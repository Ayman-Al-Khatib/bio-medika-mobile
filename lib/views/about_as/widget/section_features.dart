import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            visualDensity: const VisualDensity(vertical: -AppConstants.val_3)),
        child: ListTileTheme(
            data: const ListTileThemeData(
              dense: true,
            ),
            child: Column(
              children: [
                for (int i = 0;
                    i < AppTextsEnglish.infiFeaturesTitle.length;
                    i++)
                  ListTile(
                    leading: Icon(Icons.check, color: Colors.brown.shade600),
                    title: Text(
                        style: TextStyle(
                            color: Colors.brown.shade600,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.5,
                            fontFamily: '0'),
                        AppTextsEnglish.infiFeaturesTitle[i].tr),
                    subtitle: Text(
                      AppTextsEnglish.infiFeaturesBody[i].tr,
                      style: const TextStyle(
                        fontSize: 11.5,
                        color: AppColor.iconAndTextGrey,
                      ),
                    ),
                  ),
              ],
            )));
  }
}
