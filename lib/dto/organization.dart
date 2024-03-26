import 'package:json_annotation/json_annotation.dart';

part 'organization.g.dart';

@JsonSerializable()
class Organization {
  final String id;
  final String title;
  final String nickname;
  @JsonKey(name: 'secret_code')
  final String secretCode;

  Organization({
    required this.id,
    required this.title,
    required this.nickname,
    required this.secretCode,
  });

  factory Organization.fromJson(Map<String, dynamic> json) => _$OrganizationFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
}
