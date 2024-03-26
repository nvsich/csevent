import 'package:json_annotation/json_annotation.dart';

part 'short_event_response.g.dart';

@JsonSerializable()
class ShortEventResponse {
  final String id;
  final String name;
  final String address;
  @JsonKey(name: 'date_time')
  final String dateTime;
  final String color;

  ShortEventResponse({
    required this.id,
    required this.name,
    required this.address,
    required this.dateTime,
    required this.color,
  });

  factory ShortEventResponse.fromJson(Map<String, dynamic> json) =>
      _$ShortEventResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShortEventResponseToJson(this);
}
