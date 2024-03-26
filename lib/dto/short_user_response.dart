import 'package:json_annotation/json_annotation.dart';
import 'event_tag.dart';

part 'short_user_response.g.dart';

@JsonSerializable()
class ShortUserResponse {
  final String id;
  final String name;
  final String color;
  final List<EventTag> tags;

  ShortUserResponse({
    required this.id,
    required this.name,
    required this.color,
    required this.tags,
  });

  factory ShortUserResponse.fromJson(Map<String, dynamic> json) => _$ShortUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShortUserResponseToJson(this);
}
