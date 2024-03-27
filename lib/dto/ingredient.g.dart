// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
      productId: json['product_id'] as String,
      name: json['name'] as String,
      tag: $enumDecode(_$ProductTagEnumMap, json['tag']),
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'name': instance.name,
      'tag': _$ProductTagEnumMap[instance.tag]!,
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
