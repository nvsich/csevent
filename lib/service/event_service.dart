import 'dart:convert';

import 'package:csevent/dto/api_response.dart';
import 'package:csevent/dto/short_event_response.dart';
import 'package:csevent/dto/event.dart';
import 'package:csevent/dto/short_user_response.dart';
import 'package:csevent/dto/add_organizers_request.dart';
import 'package:csevent/dto/create_or_update_event_request.dart';
import 'package:csevent/service/response_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class EventService {
  static const apiUrl = 'http://localhost:8080/organizations';
  static const authorizationHeader = 'Authorization';
  static const headers = {'Content-Type': 'application/json'};
  static const bearer = 'Bearer ';

  final ResponseHandler responseHandler = GetIt.I<ResponseHandler>();

  Future<ApiResponse<List<ShortEventResponse>>> getAll(
      String token, String organizationId) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.get(Uri.parse('$apiUrl/$organizationId/events'),
        headers: newHeaders);

    return responseHandler.handleListResponse(
        response, ShortEventResponse.fromJson);
  }

  Future<ApiResponse<Event>> create(String token, String organizationId,
      CreateOrUpdateEventRequest request) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.post(
        Uri.parse('$apiUrl/$organizationId/events'),
        headers: newHeaders,
        body: jsonEncode(request.toJson()));

    return responseHandler.handleResponse(response, Event.fromJson);
  }

  Future<ApiResponse<Event>> update(String token, String organizationId,
      String eventId, CreateOrUpdateEventRequest request) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.put(
        Uri.parse('$apiUrl/$organizationId/events/$eventId'),
        headers: newHeaders,
        body: jsonEncode(request.toJson()));

    return responseHandler.handleResponse(response, Event.fromJson);
  }

  Future<ApiResponse<Event>> get(
      String token, String organizationId, String eventId) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.get(
        Uri.parse('$apiUrl/$organizationId/events/$eventId'),
        headers: newHeaders);

    return responseHandler.handleResponse(response, Event.fromJson);
  }

  Future<ApiResponse<Event>> delete(
      String token, String organizationId, String eventId) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.delete(
        Uri.parse('$apiUrl/$organizationId/events/$eventId'),
        headers: newHeaders);

    return responseHandler.handleResponse(response, Event.fromJson);
  }

  Future<ApiResponse<List<ShortUserResponse>>> getOrganizers(
      String token, String organizationId, String eventId) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.get(
        Uri.parse('$apiUrl/$organizationId/events/$eventId/organizers'),
        headers: newHeaders);

    return responseHandler.handleListResponse(
        response, ShortUserResponse.fromJson);
  }

  Future<ApiResponse<void>> addOrganizers(String token, String organizationId,
      String eventId, AddOrganizersRequest request) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.post(
        Uri.parse('$apiUrl/$organizationId/events/$eventId/organizers'),
        headers: newHeaders,
        body: jsonEncode(request.toJson()));

    return responseHandler.handleVoidResponse(response);
  }

  Future<ApiResponse<void>> deleteOrganizer(String token, String organizationId,
      String eventId, String organizerId) async {
    final newHeaders = _getHeadersWithToken(token);
    final response = await http.delete(
        Uri.parse(
            '$apiUrl/$organizationId/events/$eventId/organizers/$organizerId'),
        headers: newHeaders);

    return responseHandler.handleVoidResponse(response);
  }

  Map<String, String> _getHeadersWithToken(String token) {
    final Map<String, String> newHeaders = Map.from(headers);
    newHeaders.putIfAbsent(authorizationHeader, () => bearer + token);
    return newHeaders;
  }
}
