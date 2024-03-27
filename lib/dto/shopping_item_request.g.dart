// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingItemRequest _$ShoppingItemRequestFromJson(Map<String, dynamic> json) =>
    ShoppingItemRequest(
      price: (json['price'] as num).toDouble(),
      toBuyAmount: (json['to_buy_amount'] as num).toDouble(),
    );

Map<String, dynamic> _$ShoppingItemRequestToJson(
        ShoppingItemRequest instance) =>
    <String, dynamic>{
      'price': instance.price,
      'to_buy_amount': instance.toBuyAmount,
    };
