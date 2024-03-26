// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventTag _$EventTagFromJson(Map<String, dynamic> json) => EventTag(
      eventId: json['event_id'] as String,
      name: json['name'] as String,
      color: json['color'] as String,
    );

Map<String, dynamic> _$EventTagToJson(EventTag instance) => <String, dynamic>{
      'event_id': instance.eventId,
      'name': instance.name,
      'color': instance.color,
    };
