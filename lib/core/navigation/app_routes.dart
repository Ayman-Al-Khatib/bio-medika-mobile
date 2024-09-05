import 'package:bio_medika/core/constant/app_route.dart';
import 'package:bio_medika/core/middleware/my_middleware.dart';
import 'package:bio_medika/views/about_as/about_as.dart';
import 'package:bio_medika/views/account_info/account_information.dart';
import 'package:bio_medika/views/auth/forget_password.dart';
import 'package:bio_medika/views/auth/login.dart';
import 'package:bio_medika/views/auth/otp.dart';
import 'package:bio_medika/views/auth/reset_password.dart';
import 'package:bio_medika/views/auth/signup.dart';
import 'package:bio_medika/views/cart/cart_with_scaffold.dart';
import 'package:bio_medika/views/drug_details/drug_details.dart';
import 'package:bio_medika/views/categories/categories.dart';
import 'package:bio_medika/views/drugs/drug.dart';
import 'package:bio_medika/views/expiration_specials/expired.dart';
import 'package:bio_medika/views/favorite/favorite_with_scaffold.dart';
import 'package:bio_medika/views/mian_screen/main_screen.dart';
import 'package:bio_medika/views/onboarding/onboarding.dart';
import 'package:bio_medika/views/order/order_with_scaffold.dart';
import 'package:bio_medika/views/profile/profile.dart';
import 'package:bio_medika/views/splash_screen/splash.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? route = [
  GetPage(name: AppRoutes.mainScreen, page: () => const MainScreen()),
  GetPage(name: AppRoutes.favorite, page: () => const FavoriteWithScaffold()),
  GetPage(name: AppRoutes.order, page: () => const OrderWithScaffold()),
  GetPage(name: AppRoutes.drug, page: () => const Drug()),
  GetPage(name: AppRoutes.categories, page: () => const Categories()),
  GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.signUp, page: () => const SignUp()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoutes.otp, page: () => const Otp()),
  GetPage(name: AppRoutes.aboutAs, page: () => const AboutUs()),
  GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnBoarding(),
      middlewares: [MyMiddleware()]),
  GetPage(name: AppRoutes.profile, page: () => const Profile()),
  GetPage(name: AppRoutes.drugDetais, page: () => const DrugDetails()),
  GetPage(
      name: AppRoutes.accountInformation,
      page: () => const AccountInformation()),
  GetPage(name: AppRoutes.cart, page: () => const CartWithScaffold()),
  GetPage(name: AppRoutes.expired, page: () => const Expired()),
];

class NavigationService {
  static categories({dynamic argument}) =>
      Get.to(const Categories(), arguments: argument);
  static favorite({dynamic argument}) =>
      Get.toNamed(AppRoutes.favorite, arguments: argument);
  static login({dynamic argument}) =>
      Get.offAllNamed(AppRoutes.login, arguments: argument);
  static signUp({dynamic argument}) =>
      Get.offNamed(AppRoutes.signUp, arguments: argument);
  static drug({dynamic argument}) =>
      Get.toNamed(AppRoutes.drug, arguments: argument);
  static forgetPassword({dynamic argument}) =>
      Get.toNamed(AppRoutes.forgetPassword, arguments: argument);
  static resetPassword({dynamic argument}) =>
      Get.toNamed(AppRoutes.resetPassword, arguments: argument);
  static mainScreen({dynamic argument}) =>
      Get.offAllNamed(AppRoutes.mainScreen, arguments: argument);
  static splashScreen({dynamic argument}) =>
      Get.offAllNamed(AppRoutes.splash, arguments: argument);
  static otp({dynamic argument}) =>
      Get.toNamed(AppRoutes.otp, arguments: argument);
  static onboarding({dynamic argument}) =>
      Get.offAllNamed(AppRoutes.onboarding, arguments: argument);
  static profile({dynamic argument}) =>
      Get.toNamed(AppRoutes.profile, arguments: argument);
  static accountInformation({dynamic argument}) =>
      Get.toNamed(AppRoutes.accountInformation, arguments: argument);

  static drugDetails({dynamic argument}) =>
      Get.toNamed(AppRoutes.drugDetais, arguments: argument);
  static cart({dynamic argument}) =>
      Get.toNamed(AppRoutes.cart, arguments: argument);
  static expired({dynamic argument}) =>
      Get.toNamed(AppRoutes.expired, arguments: argument);
  static order({dynamic argument}) =>
      Get.toNamed(AppRoutes.order, arguments: argument);
  static aboutAs({dynamic argument}) =>
      Get.toNamed(AppRoutes.aboutAs, arguments: argument);
  static pop() => Get.back();
}
