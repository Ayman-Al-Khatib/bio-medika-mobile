import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_fonts.dart';
import 'package:bio_medika/core/helpers/get_mterial_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeEnglish = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColor.background,
    fontFamily: AppFonts.montserrat,
    textTheme: const TextTheme(
        // displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColor.black),
        // displayMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
        // bodyLarge:
        // TextStyle(height: 2, color: AppColor.grey, fontWeight: FontWeight.bold, fontSize: 14),
        // bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 14)),
        ),
    primarySwatch: getMaterialColor(AppColor.primary),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
  );

  static ThemeData themeArabic = ThemeData(
    useMaterial3: true,
    fontFamily: AppFonts.cairo,
    scaffoldBackgroundColor: AppColor.background,
    primarySwatch: getMaterialColor(AppColor.primary),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
  );
}
