import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_fonts.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/views/favorite/favorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteWithScaffold extends StatelessWidget {
  const FavoriteWithScaffold({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        surfaceTintColor: AppColor.background,
        backgroundColor: AppColor.background,
        title: Text(
          AppTextsEnglish.Favorite.tr,
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColor.primary,
              fontFamily: AppFonts.amiri),
        ),
      ),
      body: const Favorite(),
    );
  }
}
