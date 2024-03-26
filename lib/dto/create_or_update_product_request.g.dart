// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_or_update_product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrUpdateProductRequest _$CreateOrUpdateProductRequestFromJson(
        Map<String, dynamic> json) =>
    CreateOrUpdateProductRequest(
      name: json['name'] as String,
      unit: json['unit'] as String,
      amount: (json['amount'] as num).toDouble(),
      tag: $enumDecode(_$ProductTagEnumMap, json['tag']),
    );

Map<String, dynamic> _$CreateOrUpdateProductRequestToJson(
        CreateOrUpdateProductRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'unit': instance.unit,
      'amount': instance.amount,
      'tag': _$ProductTagEnumMap[instance.tag]!,
    };

const _$ProductTagEnumMap = {
  ProductTag.STRONG_ALCO: 'STRONG_ALCO',
  ProductTag.LIGHT_ALCO: 'LIGHT_ALCO',
  ProductTag.NON_ALCO: 'NON_ALCO',
  ProductTag.SYRUP: 'SYRUP',
  ProductTag.FOOD: 'FOOD',
  ProductTag.EQUIPMENT: 'EQUIPMENT',
};
