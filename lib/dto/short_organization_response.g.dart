// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_organization_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortOrganizationResponse _$ShortOrganizationResponseFromJson(
        Map<String, dynamic> json) =>
    ShortOrganizationResponse(
      id: json['id'] as String,
      title: json['title'] as String,
      role: $enumDecode(_$RoleEnumMap, json['role']),
    );

Map<String, dynamic> _$ShortOrganizationResponseToJson(
        ShortOrganizationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'role': _$RoleEnumMap[instance.role]!,
    };

const _$RoleEnumMap = {
  Role.OWNER: 'OWNER',
  Role.MEMBER: 'MEMBER',
};
