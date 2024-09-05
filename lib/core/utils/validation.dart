import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:get/get.dart';

class Validation {
  static String? isPhoneNumberValid(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber == '') {
      return AppTextsEnglish.This_field_is_required.tr;
    }
    if (!phoneNumber.startsWith("09")) {
      return AppTextsEnglish.Phone_must_start_with_09.tr;
    }
    if (phoneNumber.length < 10) {
      return AppTextsEnglish.Phone_must_be_10_characters_long.tr;
    }
    return null;
  }

  static String? checkPasswordStrength(String? password,
      {bool isLogin = false}) {
    if (password == null || password == '') {
      return AppTextsEnglish.This_field_is_required.tr;
    }
    if (password.length < 8) {
      return AppTextsEnglish.Password_should_be_at_least_8_characters.tr;
    }
    if (isLogin) return null;
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return AppTextsEnglish.Password_needs_at_least_one_uppercase_letter.tr;
    }
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return AppTextsEnglish.Password_needs_at_least_one_lowercase_letter.tr;
    }
    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return AppTextsEnglish.Password_needs_at_least_one_digit.tr;
    }
    return null;
  }

  static String? checkPasswordMatch(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword == '') {
      return AppTextsEnglish.This_field_is_required.tr;
    }

    if (password != confirmPassword) {
      return AppTextsEnglish.Password_and_Confirm_Password_do_not_match.tr;
    } else {
      return null; // Passwords match
    }
  }

  static String? validateEmail(String? email) {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (email == null || email == '') {
      return AppTextsEnglish.This_field_is_required.tr;
    }

    if (!emailRegex.hasMatch(email)) {
      return AppTextsEnglish.Invalid_email_address.tr;
    }
    return null;
  }

  static String? length(String? text, {int min = 3, int max = 50}) {
    if (text == null || text.isEmpty) {
      return AppTextsEnglish.This_field_is_required.tr;
    }

    if (text.length < min) {
      return '${AppTextsEnglish.Text_is_too_short_minimum_length_is.tr} $min';
    }

    if (text.length > max) {
      return '${AppTextsEnglish.Text_is_too_long_maximum_length_is.tr} $max';
    }

    return null;
  }
}
