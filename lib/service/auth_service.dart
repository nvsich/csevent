import 'dart:convert';

import 'package:csevent/dto/api_response.dart';
import 'package:csevent/dto/jwt_authentication_response.dart';
import 'package:csevent/dto/sign_in_request.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const apiUrl = 'http://localhost:8080/auth';
  static const headers = {
    'Authorization': '',
    'Content-Type': 'application/json'
  };
  static const ok = 200;
  static const parsingError = 'Не удалось обработать данные сервера';

  Future<ApiResponse<JwtAuthenticationResponse>> signIn(SignInRequest request) async {
    final response = await http.post(
      Uri.parse(apiUrl + '/sign-in'),
      headers: headers,
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == ok) {
      try {
        final data = JwtAuthenticationResponse.fromJson(jsonDecode(response.body));
        return ApiResponse<JwtAuthenticationResponse>(data: data);
      } catch (e) {
        return ApiResponse<JwtAuthenticationResponse>(
          error: true,
          message: parsingError,
        );
      }
    } else {
      return ApiResponse<JwtAuthenticationResponse>(
        error: true,
        message: response.body,
      );
    }
  }
}
