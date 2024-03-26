// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_warehouse_response_with_amount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortWarehouseResponseWithAmount _$ShortWarehouseResponseWithAmountFromJson(
        Map<String, dynamic> json) =>
    ShortWarehouseResponseWithAmount(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$ShortWarehouseResponseWithAmountToJson(
        ShortWarehouseResponseWithAmount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'amount': instance.amount,
    };
