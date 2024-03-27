// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cocktail _$CocktailFromJson(Map<String, dynamic> json) => Cocktail(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$CocktailTypeEnumMap, json['type']),
      eventId: json['event_id'] as String,
    );

Map<String, dynamic> _$CocktailToJson(Cocktail instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$CocktailTypeEnumMap[instance.type]!,
      'event_id': instance.eventId,
    };

const _$CocktailTypeEnumMap = {
  CocktailType.SHOT: 'SHOT',
  CocktailType.HIGHBALL: 'HIGHBALL',
};
