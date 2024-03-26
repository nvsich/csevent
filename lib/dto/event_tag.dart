import 'package:json_annotation/json_annotation.dart';

part 'event_tag.g.dart';

@JsonSerializable()
class EventTag {
  @JsonKey(name: 'event_id')
  final String eventId;
  final String name;
  final String color;

  EventTag({
    required this.eventId,
    required this.name,
    required this.color,
  });

  factory EventTag.fromJson(Map<String, dynamic> json) => _$EventTagFromJson(json);

  Map<String, dynamic> toJson() => _$EventTagToJson(this);
}
