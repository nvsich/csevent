import 'dart:convert';

import 'package:csevent/dto/api_response.dart';
import 'package:csevent/dto/search_and_filter_product_request.dart';
import 'package:csevent/dto/short_product_response.dart';
import 'package:csevent/dto/product_with_warehouses_response.dart';
import 'package:csevent/dto/product.dart';
import 'package:csevent/service/response_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static const apiUrl = 'http://localhost:8080/organizations';
  static const authorizationHeader = 'Authorization';
  static const headers = {'Content-Type': 'application/json'};
  static const bearer = 'Bearer ';

  final ResponseHandler responseHandler = GetIt.I<ResponseHandler>();

  Future<ApiResponse<List<ShortProductResponse>>> getAll(
      String token, String organizationId, SearchAndFilterProductRequest request) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.patch(
        Uri.parse('$apiUrl/$organizationId/products'),
        headers: newHeaders,
        body: jsonEncode(request.toJson()),
    );

    return responseHandler.handleListResponse(
        response, ShortProductResponse.fromJson);
  }

  Future<ApiResponse<ProductWithWarehousesResponse>> get(
      String token, String organizationId, String productId) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.get(
        Uri.parse('$apiUrl/$organizationId/products/$productId'),
        headers: newHeaders);

    return responseHandler.handleResponse(
        response, ProductWithWarehousesResponse.fromJson);
  }

  Future<ApiResponse<Product>> delete(
      String token, String organizationId, String productId) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.delete(
        Uri.parse('$apiUrl/$organizationId/products/$productId'),
        headers: newHeaders);

    return responseHandler.handleResponse(response, Product.fromJson);
  }

  Map<String, String> _getHeadersWithToken(String token) {
    final Map<String, String> newHeaders = Map.from(headers);
    newHeaders.putIfAbsent(authorizationHeader, () => bearer + token);
    return newHeaders;
  }
}
