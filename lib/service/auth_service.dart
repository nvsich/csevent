import 'dart:convert';

import 'package:csevent/dto/api_response.dart';
import 'package:csevent/dto/jwt_authentication_response.dart';
import 'package:csevent/dto/sign_in_request.dart';
import 'package:csevent/dto/sign_up_request.dart';
import 'package:csevent/service/response_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const apiUrl = 'http://10.0.2.2:8080/auth';
  static const headers = {
    'Authorization': '',
    'Content-Type': 'application/json'
  };
  static const ok = 200;
  static const parsingError = 'Не удалось обработать данные сервера';

  final ResponseHandler responseHandler = GetIt.I<ResponseHandler>();

  Future<ApiResponse<JwtAuthenticationResponse>> signIn(
      SignInRequest request) async {
    final response = await http.post(
      Uri.parse('$apiUrl/sign-in'),
      headers: headers,
      body: jsonEncode(request.toJson()),
    );

    return responseHandler.handleResponse(response, JwtAuthenticationResponse.fromJson);
  }

  Future<ApiResponse<JwtAuthenticationResponse>> signUp(
      SignUpRequest request) async {
    final response = await http.post(
      Uri.parse('$apiUrl/sign-up'),
      headers: headers,
      body: jsonEncode(request.toJson()),
    );

    return responseHandler.handleResponse(response, JwtAuthenticationResponse.fromJson);
  }
}
