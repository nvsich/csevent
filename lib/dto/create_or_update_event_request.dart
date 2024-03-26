import 'package:json_annotation/json_annotation.dart';

part 'create_or_update_event_request.g.dart';

@JsonSerializable()
class CreateOrUpdateEventRequest {
  final String name;
  final String? address;
  final int guests;
  @JsonKey(name: 'date_time')
  final String dateTime;
  final String? color;

  CreateOrUpdateEventRequest({
    required this.name,
    this.address,
    required this.guests,
    required this.dateTime,
    this.color,
  });

  factory CreateOrUpdateEventRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateOrUpdateEventRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrUpdateEventRequestToJson(this);
}
