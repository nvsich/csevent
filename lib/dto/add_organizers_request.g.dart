// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_organizers_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOrganizersRequest _$AddOrganizersRequestFromJson(
        Map<String, dynamic> json) =>
    AddOrganizersRequest(
      organizerIds: (json['organizer_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AddOrganizersRequestToJson(
        AddOrganizersRequest instance) =>
    <String, dynamic>{
      'organizer_ids': instance.organizerIds,
    };
