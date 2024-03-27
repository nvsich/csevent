import 'package:json_annotation/json_annotation.dart';

part 'add_organizers_request.g.dart';

@JsonSerializable()
class AddOrganizersRequest {
  @JsonKey(name: 'organizer_ids')
  final List<String> organizerIds;

  AddOrganizersRequest({required this.organizerIds});

  factory AddOrganizersRequest.fromJson(Map<String, dynamic> json) => _$AddOrganizersRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddOrganizersRequestToJson(this);
}
