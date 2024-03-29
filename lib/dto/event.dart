import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  final String id;
  final String name;
  final String address;
  final int guests;
  @JsonKey(name: 'date_time')
  final String dateTime;
  final String color;
  @JsonKey(name: 'organization_id')
  final String organizationId;
  final String theme;

  Event({
    required this.id,
    required this.name,
    required this.address,
    required this.guests,
    required this.dateTime,
    required this.color,
    required this.organizationId,
    required this.theme,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}
