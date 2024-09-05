import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_fonts.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/views/about_as/widget/about_us_body_text.dart';
import 'package:bio_medika/views/about_as/widget/contact_us.dart';
import 'package:bio_medika/views/about_as/widget/section_dev.dart';
import 'package:bio_medika/views/about_as/widget/section_features.dart';
import 'package:bio_medika/views/about_as/widget/about_us_title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.background,
        automaticallyImplyLeading: false,
        surfaceTintColor: AppColor.noColor,
        centerTitle: true,
        title: Text(
          AppTextsEnglish.About_Us.tr,
          style: const TextStyle(
            color: AppColor.primary,
            fontFamily: AppFonts.montserrat,
            fontSize: AppConstants.val_20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            AboutUsTitleText(title: AppTextsEnglish.About_Bio_Medical.tr),
            AboutUsBodyText(
                body: AppTextsEnglish
                    .The_Bio_Medika_App_presents_an_innovative_solution_for_pharmacists_enabling_them_to_oversee_drug_inventories_place_supply_orders_track_shipments_and_stay_informed_about_the_latest_discounts_and_offers_This_application_is_meticulously_designed_to_streamline_the_processes_of_pharmaceutical_logistics_and_sales
                    .tr),
            const Divider(),
            AboutUsTitleText(title: AppTextsEnglish.Features.tr),
            const FeaturesSection(),
            const Divider(),
            AboutUsTitleText(title: AppTextsEnglish.Meet_the_Developers.tr),
            const ListDeveloperInfo(),
            const Divider(),
            AboutUsTitleText(title: AppTextsEnglish.Contact_Us.tr),
            const ContactUs(),
            const SizedBox(
              height: 12,
            )
          ],
        ),
      ),
    );
  }
}
