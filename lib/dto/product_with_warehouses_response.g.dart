// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_with_warehouses_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductWithWarehousesResponse _$ProductWithWarehousesResponseFromJson(
        Map<String, dynamic> json) =>
    ProductWithWarehousesResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      unit: json['unit'] as String,
      warehouses: (json['warehouses'] as List<dynamic>)
          .map((e) => ShortWarehouseResponseWithAmount.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductWithWarehousesResponseToJson(
        ProductWithWarehousesResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'unit': instance.unit,
      'warehouses': instance.warehouses,
    };
