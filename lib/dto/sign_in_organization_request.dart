import 'package:json_annotation/json_annotation.dart';

part 'sign_in_organization_request.g.dart';

@JsonSerializable()
class SignInOrganizationRequest {
  final String nickname;

  @JsonKey(name: 'secret_code')
  final String secretCode;

  SignInOrganizationRequest({
    required this.nickname,
    required this.secretCode,
  });

  factory SignInOrganizationRequest.fromJson(Map<String, dynamic> json) => _$SignInOrganizationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignInOrganizationRequestToJson(this);
}
