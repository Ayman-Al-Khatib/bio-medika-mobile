import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperInfo extends StatelessWidget {
  final String name;
  final String role;
  final String bio;
  final String linkedInUrl;

  const DeveloperInfo(
      {super.key,
      required this.name,
      required this.role,
      required this.bio,
      required this.linkedInUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.val_14, vertical: AppConstants.val_3),
      child: GestureDetector(
        onTap: () async {
          if (await launchUrl(
            Uri.parse(linkedInUrl),
            mode: LaunchMode.platformDefault,
            webViewConfiguration:
                const WebViewConfiguration(enableDomStorage: false),
          )) {
            return;
          }

          if (await launchUrl(
            Uri.parse(linkedInUrl),
            mode: LaunchMode.externalNonBrowserApplication,
            webViewConfiguration:
                const WebViewConfiguration(enableDomStorage: false),
          )) {
            return;
          }
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.val_8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    fontSize: AppConstants.val_18,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown.shade600,
                  ),
                ),
                Text(
                  role,
                  style: const TextStyle(
                      fontSize: AppConstants.val_16,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      fontFamily: '0'),
                ),
                const SizedBox(height: AppConstants.val_4),
                Text(
                  bio,
                  style: const TextStyle(
                      fontSize: AppConstants.val_14, fontFamily: '0'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListDeveloperInfo extends StatelessWidget {
  const ListDeveloperInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DeveloperInfo(
            name: AppTextsEnglish.Ayman_Al_Khatib.tr,
            role: AppTextsEnglish.FrontEnd_Developer.tr,
            bio: AppTextsEnglish.infoDevAyman.tr,
            linkedInUrl:
                'https://www.linkedin.com/in/ayman-alkhatib-82547a243/'),
        DeveloperInfo(
          name: AppTextsEnglish.Omar_Bakdash.tr,
          role: AppTextsEnglish.FrontEnd_Developer.tr,
          bio: AppTextsEnglish.infoDevOmar.tr,
          linkedInUrl: 'https://www.linkedin.com/in/omar-bkdash-14782a2a9/',
        ),
        DeveloperInfo(
          name: AppTextsEnglish.Ahmad_Ajajeh.tr,
          role: AppTextsEnglish.BackEnd_Developer.tr,
          bio: AppTextsEnglish.infoDevAhmad.tr,
          linkedInUrl: 'https://www.linkedin.com/in/ahmed-ajajeh-b999b6175/',
        ),
      ],
    );
  }
}
