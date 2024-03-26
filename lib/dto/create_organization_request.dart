import 'package:json_annotation/json_annotation.dart';

part 'create_organization_request.g.dart';

@JsonSerializable()
class CreateOrganizationRequest {
  final String title;

  final String nickname;

  @JsonKey(name: 'secret_code')
  final String secretCode;

  CreateOrganizationRequest({
    required this.title,
    required this.nickname,
    required this.secretCode,
  });

  factory CreateOrganizationRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateOrganizationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrganizationRequestToJson(this);
}
