import 'package:bio_medika/core/constant/app_assets_svg.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/models/onboarding_model.dart';
import 'package:get/get.dart';

final List<OnboardingModel> onboardingData = [
  OnboardingModel(
    imagePath: AppAssetsSvg.onboarding_1,
    title: AppTextsEnglish.onboardingTitle_1.tr,
    body: AppTextsEnglish.onboardingBody_1.tr,
  ),
  OnboardingModel(
    imagePath: AppAssetsSvg.onboarding_2,
    title: AppTextsEnglish.onboardingTitle_2.tr,
    body: AppTextsEnglish.onboardingBody_2.tr,
  ),
  OnboardingModel(
    imagePath: AppAssetsSvg.onboarding_3,
    title: AppTextsEnglish.onboardingTitle_3.tr,
    body: AppTextsEnglish.onboardingBody_3.tr,
  ),
  OnboardingModel(
    imagePath: AppAssetsSvg.onboarding_4,
    title: AppTextsEnglish.onboardingTitle_4.tr,
    body: AppTextsEnglish.onboardingBody_4.tr,
  ),
  OnboardingModel(
    imagePath: AppAssetsSvg.onboarding_5,
    title: AppTextsEnglish.onboardingTitle_5.tr,
    body: AppTextsEnglish.onboardingBody_5.tr,
  ),
];
