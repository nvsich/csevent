// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingItemInfoResponse _$ShoppingItemInfoResponseFromJson(
        Map<String, dynamic> json) =>
    ShoppingItemInfoResponse(
      productId: json['product_id'] as String,
      name: json['name'] as String,
      unit: json['unit'] as String,
      totalAmount: (json['total_amount'] as num).toDouble(),
      toBuyAmount: (json['to_buy_amount'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$ShoppingItemInfoResponseToJson(
        ShoppingItemInfoResponse instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'name': instance.name,
      'unit': instance.unit,
      'total_amount': instance.totalAmount,
      'to_buy_amount': instance.toBuyAmount,
      'price': instance.price,
    };
