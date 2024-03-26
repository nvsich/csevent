// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail_with_ingredients_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CocktailWithIngredientsResponse _$CocktailWithIngredientsResponseFromJson(
        Map<String, dynamic> json) =>
    CocktailWithIngredientsResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$CocktailTypeEnumMap, json['type']),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CocktailWithIngredientsResponseToJson(
        CocktailWithIngredientsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$CocktailTypeEnumMap[instance.type]!,
      'ingredients': instance.ingredients,
    };

const _$CocktailTypeEnumMap = {
  CocktailType.SHOT: 'SHOT',
  CocktailType.HIGHBALL: 'HIGHBALL',
};
