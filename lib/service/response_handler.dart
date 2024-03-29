import 'dart:convert';

import 'package:csevent/dto/api_response.dart';
import 'package:http/http.dart' as http;

class ResponseHandler {
  static const ok = 200;
  static const unauthorized = 403;
  static const parsingError = 'Не удалось обработать данные сервера';
  static const unauthorizedError = 'Не авторизован. Проверьте запрос';

  ApiResponse<T> handleResponse<T>(
      http.Response response, T Function(Map<String, dynamic>) fromJsonT) {
    if (response.statusCode == ok) {
      try {
        final data = fromJsonT(jsonDecode(response.body));
        return ApiResponse<T>(data: data);
      } catch (e) {
        return ApiResponse<T>(
          error: true,
          message: parsingError,
        );
      }
    } else {
      String message = response.statusCode == unauthorized
          ? unauthorizedError
          : response.body;
      return ApiResponse<T>(
        error: true,
        message: message,
      );
    }
  }

  Future<ApiResponse<List<T>>> handleListResponse<T>(http.Response response,
      T Function(Map<String, dynamic>) fromJsonT) async {
    if (response.statusCode == ok) {
      try {
        final List<dynamic> jsonList =
            json.decode(response.body) as List<dynamic>;
        final List<T> dataList = jsonList
            .map((jsonItem) => fromJsonT(jsonItem as Map<String, dynamic>))
            .toList();
        return ApiResponse(data: dataList);
      } catch (e) {
        return ApiResponse<List<T>>(
          error: true,
          message: parsingError,
        );
      }
    } else {
      String message = response.statusCode == unauthorized
          ? unauthorizedError
          : response.body;
      return ApiResponse<List<T>>(
        error: true,
        message: message,
      );
    }
  }

  Future<ApiResponse<void>> handleVoidResponse(http.Response response) async {
    final ApiResponse<dynamic> apiResponse = handleResponse<dynamic>(
      response,
      (_) => null,
    );
    return ApiResponse<void>(
      error: apiResponse.error,
      message: apiResponse.message,
    );
  }
}
