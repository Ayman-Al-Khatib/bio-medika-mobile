import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isArabic = Get.find<MyAppServices>().appIsArabic();

    return Padding(
      padding: EdgeInsets.only(
          left: isArabic ? AppConstants.val_10 : AppConstants.val_14,
          right: !isArabic ? AppConstants.val_10 : AppConstants.val_14,
          top: AppConstants.val_2,
          bottom: AppConstants.val_4),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            color: AppColor.iconAndTextGrey,
            fontWeight: FontWeight.w500,
            fontSize: 13,
            fontFamily: '0',
          ),
          children: <TextSpan>[
            TextSpan(
                text: AppTextsEnglish
                    .For_more_information_or_support_please_contact_us_at.tr),
            TextSpan(
              text: 'ayman.jop.000@gmail.com',
              style: const TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  String? encodeQueryParameters(Map<String, String> params) {
                    return params.entries
                        .map((MapEntry<String, String> e) =>
                            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                        .join('&');
                  }

                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'ayman.jop.000@gmail.com',
                    query: encodeQueryParameters(<String, String>{
                      'subject': AppTextsEnglish.Hello.tr,
                    }),
                  );

                  await launchUrl(emailLaunchUri);
                },
            ),
          ],
        ),
      ),
    );
  }
}
