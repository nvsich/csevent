// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_or_update_event_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrUpdateEventRequest _$CreateOrUpdateEventRequestFromJson(
        Map<String, dynamic> json) =>
    CreateOrUpdateEventRequest(
      name: json['name'] as String,
      address: json['address'] as String?,
      guests: json['guests'] as int,
      dateTime: json['date_time'] as String,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$CreateOrUpdateEventRequestToJson(
        CreateOrUpdateEventRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'guests': instance.guests,
      'date_time': instance.dateTime,
      'color': instance.color,
    };
