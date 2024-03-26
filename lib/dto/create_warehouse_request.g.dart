// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_warehouse_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateWarehouseRequest _$CreateWarehouseRequestFromJson(
        Map<String, dynamic> json) =>
    CreateWarehouseRequest(
      name: json['name'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$CreateWarehouseRequestToJson(
        CreateWarehouseRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
    };
