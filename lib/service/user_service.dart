import 'dart:convert';

import 'package:csevent/dto/user.dart';
import 'package:csevent/dto/update_user_data_request.dart';
import 'package:csevent/dto/short_organization_response.dart';
import 'package:csevent/dto/api_response.dart';
import 'package:csevent/service/response_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class UserService {
  static const apiUrl = 'http://10.0.2.2:8080/user';
  static const authorizationHeader = 'Authorization';
  static const headers = {'Content-Type': 'application/json'};
  static const bearer = 'Bearer ';

  final ResponseHandler responseHandler = GetIt.I<ResponseHandler>();

  Future<ApiResponse<User>> get(String token) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.get(Uri.parse(apiUrl), headers: newHeaders);

    return responseHandler.handleResponse(
      response,
      User.fromJson,
    );
  }

  Future<ApiResponse<User>> update(
    String token,
    UpdateUserDataRequest request,
  ) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.put(
      Uri.parse(apiUrl),
      headers: newHeaders,
      body: jsonEncode(request.toJson()),
    );

    return responseHandler.handleResponse(
      response,
      User.fromJson,
    );
  }

  Future<ApiResponse<List<ShortOrganizationResponse>>> getOrganizations(
    String token,
  ) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.get(
      Uri.parse('$apiUrl/organizations'),
      headers: newHeaders,
    );

    return responseHandler.handleListResponse(
      response,
      ShortOrganizationResponse.fromJson,
    );
  }

  Map<String, String> _getHeadersWithToken(String token) {
    final Map<String, String> newHeaders = Map.from(headers);
    newHeaders.putIfAbsent(authorizationHeader, () => bearer + token);
    return newHeaders;
  }
}
