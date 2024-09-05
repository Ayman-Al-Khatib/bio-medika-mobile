import 'package:bio_medika/core/enum/status_request_enum.dart';

class ResponseData {
  final dynamic errors;
  final StatusRequest statusRequest;
  final dynamic data;

  ResponseData({this.errors, this.data, required this.statusRequest}) {
    assert(!(statusRequest == StatusRequest.success && data == null),
        'Error: Data cannot be null for a successful request.');
  }
}
