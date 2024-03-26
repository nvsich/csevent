// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingItemResponse _$ShoppingItemResponseFromJson(
        Map<String, dynamic> json) =>
    ShoppingItemResponse(
      productId: json['product_id'] as String,
      name: json['name'] as String,
      tag: $enumDecode(_$ProductTagEnumMap, json['tag']),
      unit: json['unit'] as String,
      amount: (json['amount'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      isPurchased: json['is_purchased'] as bool,
    );

Map<String, dynamic> _$ShoppingItemResponseToJson(
        ShoppingItemResponse instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'name': instance.name,
      'tag': _$ProductTagEnumMap[instance.tag]!,
      'unit': instance.unit,
      'amount': instance.amount,
      'price': instance.price,
      'is_purchased': instance.isPurchased,
    };

const _$ProductTagEnumMap = {
  ProductTag.STRONG_ALCO: 'STRONG_ALCO',
  ProductTag.LIGHT_ALCO: 'LIGHT_ALCO',
  ProductTag.NON_ALCO: 'NON_ALCO',
  ProductTag.SYRUP: 'SYRUP',
  ProductTag.FOOD: 'FOOD',
  ProductTag.EQUIPMENT: 'EQUIPMENT',
};
