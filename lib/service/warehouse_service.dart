import 'dart:convert';

import 'package:csevent/dto/api_response.dart';
import 'package:csevent/dto/short_product_response.dart';
import 'package:csevent/dto/warehouse.dart';
import 'package:csevent/dto/create_warehouse_request.dart';
import 'package:csevent/dto/warehouse_with_products_response.dart';
import 'package:csevent/dto/create_or_update_product_request.dart';
import 'package:csevent/dto/product.dart';
import 'package:csevent/service/response_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class WarehouseService {
  static const apiUrl = 'http://localhost:8080/organizations';
  static const authorizationHeader = 'Authorization';
  static const headers = {'Content-Type': 'application/json'};
  static const bearer = 'Bearer ';

  final ResponseHandler responseHandler = GetIt.I<ResponseHandler>();

  Future<ApiResponse<List<Warehouse>>> getAll(
      String token, String organizationId) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.get(
        Uri.parse('$apiUrl/$organizationId/warehouses'),
        headers: newHeaders);

    return responseHandler.handleListResponse(response, Warehouse.fromJson);
  }

  Future<ApiResponse<Warehouse>> create(String token, String organizationId,
      CreateWarehouseRequest request) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.post(
        Uri.parse('$apiUrl/$organizationId/warehouses'),
        headers: newHeaders,
        body: jsonEncode(request.toJson())
    );

    return responseHandler.handleResponse(response, Warehouse.fromJson);
  }

  Future<ApiResponse<WarehouseWithProductsResponse>> get(
      String token, String organizationId, String warehouseId) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.get(
        Uri.parse('$apiUrl/$organizationId/warehouses/$warehouseId'),
        headers: newHeaders);

    return responseHandler.handleResponse(
        response, WarehouseWithProductsResponse.fromJson);
  }

  Future<ApiResponse<Warehouse>> delete(
      String token, String organizationId, String warehouseId) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.delete(
        Uri.parse('$apiUrl/$organizationId/warehouses/$warehouseId'),
        headers: newHeaders);

    return responseHandler.handleResponse(response, Warehouse.fromJson);
  }

  Future<ApiResponse<List<ShortProductResponse>>> getHints(
      String token, String organizationId, String warehouseId) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.get(
        Uri.parse(
            '$apiUrl/$organizationId/warehouses/$warehouseId/products/get-hints'),
        headers: newHeaders);

    return responseHandler.handleListResponse(
        response, ShortProductResponse.fromJson);
  }

  Future<ApiResponse<Product>> saveProduct(String token, String organizationId,
      String warehouseId, CreateOrUpdateProductRequest request) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.post(
        Uri.parse('$apiUrl/$organizationId/warehouses/$warehouseId/products'),
        headers: newHeaders,
        body: jsonEncode(request.toJson()));

    return responseHandler.handleResponse(response, Product.fromJson);
  }

  Future<ApiResponse<Product>> updateProduct(
      String token,
      String organizationId,
      String warehouseId,
      String productId,
      CreateOrUpdateProductRequest request) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.put(
        Uri.parse(
            '$apiUrl/$organizationId/warehouses/$warehouseId/products/$productId'),
        headers: newHeaders,
        body: jsonEncode(request.toJson()));

    return responseHandler.handleResponse(response, Product.fromJson);
  }

  Future<ApiResponse<void>> deleteProduct(String token, String organizationId,
      String warehouseId, String productId) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.delete(
        Uri.parse(
            '$apiUrl/$organizationId/warehouses/$warehouseId/products/$productId'),
        headers: newHeaders);

    return responseHandler.handleVoidResponse(response);
  }

  Map<String, String> _getHeadersWithToken(String token) {
    final Map<String, String> newHeaders = Map.from(headers);
    newHeaders.putIfAbsent(authorizationHeader, () => bearer + token);
    return newHeaders;
  }
}
