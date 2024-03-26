// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_or_update_cocktail_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrUpdateCocktailRequest _$CreateOrUpdateCocktailRequestFromJson(
        Map<String, dynamic> json) =>
    CreateOrUpdateCocktailRequest(
      name: json['name'] as String,
      type: $enumDecode(_$CocktailTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$CreateOrUpdateCocktailRequestToJson(
        CreateOrUpdateCocktailRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': _$CocktailTypeEnumMap[instance.type]!,
    };

const _$CocktailTypeEnumMap = {
  CocktailType.SHOT: 'SHOT',
  CocktailType.HIGHBALL: 'HIGHBALL',
};
