// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortUserResponse _$ShortUserResponseFromJson(Map<String, dynamic> json) =>
    ShortUserResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      color: json['color'] as String,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => EventTag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShortUserResponseToJson(ShortUserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'tags': instance.tags,
    };
