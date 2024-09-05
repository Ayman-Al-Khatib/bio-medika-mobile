import 'dart:convert';
import 'dart:developer';

import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/utils/network_checker.dart';
import 'package:bio_medika/models/response_data.dart';
import 'package:bio_medika/models/user_model.dart';
import 'package:get/get.dart';

Future<ResponseData> handleRequest({
  required bool token,
  required Function function,
}) async {
  final NetworkChecker networkChecker = NetworkChecker(); //! TODO singltone

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    if (token) 'Authorization': 'Bearer ${UserModel.get().token}'
  };

  try {
    if (await networkChecker.isOnline()) {
      final response = await function(headers);
      final Map responseBody = jsonDecode(response.body);
      log(json.encode(responseBody));
      if (responseBody['status'] == "success") {
        if (responseBody['data'] is List && responseBody['data'].isEmpty) {
          return ResponseData(
            data: responseBody['data'],
            statusRequest: StatusRequest.empty,
          );
        } else {
          return ResponseData(
            data: responseBody['data'],
            statusRequest: StatusRequest.success,
          );
        }
      } else {
        return ResponseData(
          errors: responseBody['errors'],
          statusRequest: StatusRequest.serverFailure,
        );
      }
    } else {
      return ResponseData(
        errors: AppTextsEnglish.Connect_to_the_Internet_and_try_again.tr,
        statusRequest: StatusRequest.offline,
      );
    }
  } catch (err) {
    log('-********************************************');
    print(err);

    return ResponseData(
      errors: AppTextsEnglish.An_unexpected_error_occurred_Try_again_later.tr,
      statusRequest: StatusRequest.serverException,
    );
  }
}
