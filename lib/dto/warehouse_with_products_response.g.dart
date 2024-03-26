// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_with_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseWithProductsResponse _$WarehouseWithProductsResponseFromJson(
        Map<String, dynamic> json) =>
    WarehouseWithProductsResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => ShortProductResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WarehouseWithProductsResponseToJson(
        WarehouseWithProductsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'products': instance.products,
    };
