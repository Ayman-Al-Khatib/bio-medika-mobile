import 'package:bio_medika/core/enum/status_request_enum.dart';

StatusRequest statusResponse(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    if (response['data'] != null) {
      return StatusRequest.success;
    } else {
      return StatusRequest.failure;
    }
  }
}
