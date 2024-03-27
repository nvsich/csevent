// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      guests: json['guests'] as int,
      dateTime: json['date_time'] as String,
      color: json['color'] as String,
      organizationId: json['organization_id'] as String,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'guests': instance.guests,
      'date_time': instance.dateTime,
      'color': instance.color,
      'organization_id': instance.organizationId,
    };
