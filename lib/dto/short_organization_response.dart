import 'package:json_annotation/json_annotation.dart';
import 'enum/role.dart';

part 'short_organization_response.g.dart';

@JsonSerializable()
class ShortOrganizationResponse {
  final String id;
  final String title;
  final Role role;

  ShortOrganizationResponse({
    required this.id,
    required this.title,
    required this.role,
  });

  factory ShortOrganizationResponse.fromJson(Map<String, dynamic> json) =>
      _$ShortOrganizationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShortOrganizationResponseToJson(this);
}
