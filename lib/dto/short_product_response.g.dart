// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortProductResponse _$ShortProductResponseFromJson(
        Map<String, dynamic> json) =>
    ShortProductResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      tag: $enumDecode(_$ProductTagEnumMap, json['tag']),
      unit: json['unit'] as String,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$ShortProductResponseToJson(
        ShortProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tag': _$ProductTagEnumMap[instance.tag]!,
      'unit': instance.unit,
      'amount': instance.amount,
    };

const _$ProductTagEnumMap = {
  ProductTag.STRONG_ALCO: 'STRONG_ALCO',
  ProductTag.LIGHT_ALCO: 'LIGHT_ALCO',
  ProductTag.NON_ALCO: 'NON_ALCO',
  ProductTag.SYRUP: 'SYRUP',
  ProductTag.FOOD: 'FOOD',
  ProductTag.EQUIPMENT: 'EQUIPMENT',
};
