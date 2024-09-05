import 'dart:convert';
import 'dart:io';

import 'package:bio_medika/core/helpers/handler_response.dart';
import 'package:bio_medika/models/response_data.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class Crud {
  Future<ResponseData> postData({
    required String linkUrl,
    Map data = const {},
    bool token = false,
  }) async {
    return handleRequest(
        function: (Map<String, String> headers) async {
          return await http
              .post(
                Uri.parse(linkUrl),
                body: jsonEncode(data),
                headers: headers,
              )
              .timeout(const Duration(seconds: 5));
        },
        token: token);
  }

  Future<ResponseData> deleteData(
      {required String linkUrl, Map data = const {}, bool token = false}) async {
    return handleRequest(
        function: (Map<String, String> headers) async {
          return await http
              .delete(
                Uri.parse(linkUrl),
                body: jsonEncode(data),
                headers: headers,
              )
              .timeout(const Duration(seconds: 5));
        },
        token: token);
  }

  Future<ResponseData> putData(
      {required String linkUrl, Map data = const {}, bool token = false}) async {
    return handleRequest(
        function: (Map<String, String> headers) async {
          return await http
              .put(
                Uri.parse(linkUrl),
                body: jsonEncode(data),
                headers: headers,
              )
              .timeout(const Duration(seconds: 5));
        },
        token: token);
  }

  Future<ResponseData> getData({required String linkUrl, bool token = false}) async {
    return handleRequest(
        function: (Map<String, String> headers) async {
          return await http.get(Uri.parse(linkUrl), headers: headers);
        },
        token: token);
  }

  Future<ResponseData> postWithImageData(
      {required String linkUrl,
      required Map<String, dynamic> data,
      required File? image,
      String fieldName = 'files',
      bool token = false}) async {
    return handleRequest(
        function: (Map<String, String> headers) async {
          final uri = Uri.parse(linkUrl);
          final request = http.MultipartRequest("POST", uri);
          request.headers.addAll(headers);
          if (image != null) {
            final length = await image.length();

            final stream = http.ByteStream(image.openRead());
            final multipartFile = http.MultipartFile(
              fieldName,
              stream,
              length,
              filename: basename(image.path),
            );
            request.files.add(multipartFile);
          }

          data.forEach((key, value) {
            request.fields[key] = value;
          });

          final myRequest = await request.send();
          return await http.Response.fromStream(myRequest).timeout(const Duration(seconds: 5));
        },
        token: token);
  }
}
