import 'dart:convert';

import 'package:csevent/dto/api_response.dart';
import 'package:csevent/dto/cocktail_with_ingredients_response.dart';
import 'package:csevent/dto/cocktail.dart';
import 'package:csevent/dto/create_or_update_cocktail_request.dart';
import 'package:csevent/dto/short_product_response.dart';
import 'package:csevent/dto/create_or_update_product_request.dart';
import 'package:csevent/dto/product.dart';
import 'package:csevent/service/response_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class CocktailService {
  static const apiUrl = 'http://10.0.2.2:8080/organizations';
  static const authorizationHeader = 'Authorization';
  static const headers = {'Content-Type': 'application/json'};
  static const bearer = 'Bearer ';

  final ResponseHandler responseHandler = GetIt.I<ResponseHandler>();

  Future<ApiResponse<List<CocktailWithIngredientsResponse>>> getAll(
      String token, String organizationId, String eventId) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.get(
        Uri.parse('$apiUrl/$organizationId/events/$eventId/cocktails'),
        headers: newHeaders);

    return responseHandler.handleListResponse(
        response, CocktailWithIngredientsResponse.fromJson);
  }

  Future<ApiResponse<Cocktail>> create(String token, String organizationId,
      String eventId, CreateOrUpdateCocktailRequest request) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.post(
        Uri.parse('$apiUrl/$organizationId/events/$eventId/cocktails'),
        headers: newHeaders,
        body: jsonEncode(request.toJson()));

    return responseHandler.handleResponse(response, Cocktail.fromJson);
  }

  Future<ApiResponse<CocktailWithIngredientsResponse>> get(String token,
      String organizationId, String eventId, String cocktailId) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.get(
        Uri.parse(
            '$apiUrl/$organizationId/events/$eventId/cocktails/$cocktailId'),
        headers: newHeaders);

    return responseHandler.handleResponse(
        response, CocktailWithIngredientsResponse.fromJson);
  }

  Future<ApiResponse<Cocktail>> delete(String token, String organizationId,
      String eventId, String cocktailId) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.delete(
        Uri.parse(
            '$apiUrl/$organizationId/events/$eventId/cocktails/$cocktailId'),
        headers: newHeaders);

    return responseHandler.handleResponse(response, Cocktail.fromJson);
  }

  Future<ApiResponse<List<ShortProductResponse>>> getHints(String token,
      String organizationId, String eventId, String cocktailId) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.get(
        Uri.parse(
            '$apiUrl/$organizationId/events/$eventId/cocktails/$cocktailId/products/get-hints'),
        headers: newHeaders);

    return responseHandler.handleListResponse(
        response, ShortProductResponse.fromJson);
  }

  Future<ApiResponse<Product>> saveProduct(
      String token,
      String organizationId,
      String eventId,
      String cocktailId,
      CreateOrUpdateProductRequest request) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.post(
        Uri.parse(
            '$apiUrl/$organizationId/events/$eventId/cocktails/$cocktailId/products'),
        headers: newHeaders,
        body: jsonEncode(request.toJson()));

    return responseHandler.handleResponse(response, Product.fromJson);
  }

  Future<ApiResponse<Product>> updateProduct(
      String token,
      String organizationId,
      String eventId,
      String cocktailId,
      String productId,
      CreateOrUpdateProductRequest request) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.put(
        Uri.parse(
            '$apiUrl/$organizationId/events/$eventId/cocktails/$cocktailId/products/$productId'),
        headers: newHeaders,
        body: jsonEncode(request.toJson()));

    return responseHandler.handleResponse(response, Product.fromJson);
  }

  Future<ApiResponse<void>> deleteProduct(String token, String organizationId,
      String eventId, String cocktailId, String productId) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.delete(
        Uri.parse(
            '$apiUrl/$organizationId/events/$eventId/cocktails/$cocktailId/products/$productId'),
        headers: newHeaders);

    return responseHandler.handleVoidResponse(response);
  }

  Map<String, String> _getHeadersWithToken(String token) {
    final Map<String, String> newHeaders = Map.from(headers);
    newHeaders.putIfAbsent(authorizationHeader, () => bearer + token);
    return newHeaders;
  }
}
