import 'dart:convert';

import 'package:csevent/dto/api_response.dart';
import 'package:csevent/dto/sign_in_organization_request.dart';
import 'package:csevent/dto/create_organization_request.dart';
import 'package:csevent/dto/organization.dart';
import 'package:csevent/dto/short_user_response.dart';
import 'package:csevent/service/response_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class OrganizationService {
  static const apiUrl = 'http://10.0.2.2:8080/organizations';
  static const authorizationHeader = 'Authorization';
  static const headers = {'Content-Type': 'application/json'};
  static const bearer = 'Bearer ';

  final ResponseHandler responseHandler = GetIt.I<ResponseHandler>();

  Future<ApiResponse<Organization>> signIn(
      String token, SignInOrganizationRequest request) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.post(
      Uri.parse('$apiUrl/sign-in'),
      headers: newHeaders,
      body: jsonEncode(request.toJson()),
    );

    return responseHandler.handleResponse(response, Organization.fromJson);
  }

  Future<ApiResponse<Organization>> create(
      String token, CreateOrganizationRequest request) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.post(
      Uri.parse('$apiUrl/create'),
      headers: newHeaders,
      body: jsonEncode(request.toJson()),
    );

    return responseHandler.handleResponse(response, Organization.fromJson);
  }

  Future<ApiResponse<List<ShortUserResponse>>> getAllMembers(
      String token, String organizationId) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.get(
      Uri.parse('$apiUrl/$organizationId/members'),
      headers: newHeaders,
    );

    return responseHandler.handleListResponse(
        response, ShortUserResponse.fromJson);
  }

  Map<String, String> _getHeadersWithToken(String token) {
    final Map<String, String> newHeaders = Map.from(headers);
    newHeaders.putIfAbsent(authorizationHeader, () => bearer + token);
    return newHeaders;
  }
}
