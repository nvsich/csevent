import 'dart:convert';

import 'package:csevent/dto/api_response.dart';
import 'package:csevent/dto/shopping_item_response.dart';
import 'package:csevent/dto/shopping_item_info_response.dart';
import 'package:csevent/dto/product_with_warehouses_response.dart';
import 'package:csevent/dto/shopping_item_request.dart';
import 'package:csevent/service/response_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class ShoppingService {
  static const apiUrl = 'http://localhost:8080/organizations';
  static const authorizationHeader = 'Authorization';
  static const headers = {'Content-Type': 'application/json'};
  static const bearer = 'Bearer ';

  final ResponseHandler responseHandler = GetIt.I<ResponseHandler>();

  Future<ApiResponse<List<ShoppingItemResponse>>> getAll(
      String token, String organizationId, String eventId) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.get(
        Uri.parse('$apiUrl/$organizationId/events/$eventId/shopping'),
        headers: newHeaders);

    return responseHandler.handleListResponse(
        response, ShoppingItemResponse.fromJson);
  }

  Future<ApiResponse<ShoppingItemInfoResponse>> get(String token,
      String organizationId, String eventId, String productId) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.get(
        Uri.parse(
            '$apiUrl/$organizationId/events/$eventId/shopping/$productId'),
        headers: newHeaders);

    return responseHandler.handleResponse(
        response, ShoppingItemInfoResponse.fromJson);
  }

  Future<ApiResponse<void>> updateIsPurchased(String token,
      String organizationId, String eventId, String productId) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.patch(
        Uri.parse(
            '$apiUrl/$organizationId/events/$eventId/shopping/$productId'),
        headers: newHeaders);

    return responseHandler.handleVoidResponse(response);
  }

  Future<ApiResponse<ProductWithWarehousesResponse>> getWithWarehouses(
      String token,
      String organizationId,
      String eventId,
      String productId) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.get(
        Uri.parse(
            '$apiUrl/$organizationId/events/$eventId/shopping/$productId/warehouses'),
        headers: newHeaders);

    return responseHandler.handleResponse(
        response, ProductWithWarehousesResponse.fromJson);
  }

  Future<ApiResponse<void>> update(String token, String organizationId,
      String eventId, String productId, ShoppingItemRequest request) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.put(
        Uri.parse(
            '$apiUrl/$organizationId/events/$eventId/shopping/$productId'),
        headers: newHeaders,
        body: jsonEncode(request.toJson()));

    return responseHandler.handleVoidResponse(response);
  }

  Map<String, String> _getHeadersWithToken(String token) {
    final Map<String, String> newHeaders = Map.from(headers);
    newHeaders.putIfAbsent(authorizationHeader, () => bearer + token);
    return newHeaders;
  }
}
