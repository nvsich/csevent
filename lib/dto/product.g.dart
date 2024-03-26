// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String,
      name: json['name'] as String,
      unit: json['unit'] as String,
      organizationId: json['organization_id'] as String,
      tag: $enumDecode(_$ProductTagEnumMap, json['tag']),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'unit': instance.unit,
      'organization_id': instance.organizationId,
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
