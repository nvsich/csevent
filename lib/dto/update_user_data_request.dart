import 'package:json_annotation/json_annotation.dart';

part 'update_user_data_request.g.dart';

@JsonSerializable()
class UpdateUserDataRequest {
  final String name;
  final String color;

  UpdateUserDataRequest({
    required this.name,
    required this.color
  });

  factory UpdateUserDataRequest.fromJson(Map<String, dynamic> json) => _$UpdateUserDataRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserDataRequestToJson(this);
}