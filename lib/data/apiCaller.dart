import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';

class apiCaller {
  static final Logger _logger = Logger();

  static Future<apiResponse> _getRequest({required String url}) async {
    Uri uri = Uri.parse(url);
    logRequest(url);
    Response response = await get(uri);
    logResponse(url, response);
    final int statusCode = response.statusCode;
    try {
      if (statusCode == 200) {
        //success
        final decodedData = jsonDecode(response.body);
        return apiResponse(
          isSuccess: true,
          responseData: decodedData,
          responseCode: statusCode,
        );
      } else {
        final decodedData = jsonDecode(response.body);
        return apiResponse(
          isSuccess: false,
          responseData: decodedData,
          responseCode: statusCode,
        );
      }
    } on Exception catch (e) {
      final decodedData = jsonDecode(response.body);
      return apiResponse(
        isSuccess: false,
        responseData: null,
        responseCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  Future<apiResponse> _postRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    Uri uri = Uri.parse(url);
    logRequest(url,body: body);
    Response response = await post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),

    );
    logResponse(url, response);
    try {
      final int statusCode = response.statusCode;
      if (statusCode == 200 || statusCode == 201) {
        final decodedData = jsonDecode(response.body);
        return apiResponse(
          isSuccess: true,
          responseData: decodedData,
          responseCode: statusCode,
        );
      } else {
        final decodedData = jsonDecode(response.body);
        return apiResponse(
          isSuccess: false,
          responseData: decodedData,
          responseCode: statusCode,
        );
      }
    } on Exception catch (e) {
      final decodedData = jsonDecode(response.body);
      return apiResponse(
        isSuccess: false,
        responseData: decodedData,
        responseCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  static void logRequest(String url, {Map<String, dynamic>? body}) {
    _logger.i(
      'url: $url\n'
      'Request Body: $body',
    );
  }

  static void logResponse(String url, Response response) {
    _logger.i(
      'url: $url\n'
      'Request Body: ${response.body}\n'
      'Status code: ${response.statusCode}',
    );
  }
}

class apiResponse {
  final bool isSuccess;
  final dynamic responseData;
  final String? errorMessage;
  final int responseCode;

  apiResponse({
    required this.isSuccess,
    required this.responseData,
    this.errorMessage = 'Somthing went worng',
    required this.responseCode,
  });
}
