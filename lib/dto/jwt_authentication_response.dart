import 'package:json_annotation/json_annotation.dart';

part 'jwt_authentication_response.g.dart';

@JsonSerializable()
class JwtAuthenticationResponse {
  final String token;

  JwtAuthenticationResponse({
    required this.token,
  });

  factory JwtAuthenticationResponse.fromJson(Map<String, dynamic> json) => _$JwtAuthenticationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$JwtAuthenticationResponseToJson(this);
}
