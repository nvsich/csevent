// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_event_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortEventResponse _$ShortEventResponseFromJson(Map<String, dynamic> json) =>
    ShortEventResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      dateTime: json['date_time'] as String,
      color: json['color'] as String,
    );

Map<String, dynamic> _$ShortEventResponseToJson(ShortEventResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'date_time': instance.dateTime,
      'color': instance.color,
    };
