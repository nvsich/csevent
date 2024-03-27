// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_organization_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrganizationRequest _$CreateOrganizationRequestFromJson(
        Map<String, dynamic> json) =>
    CreateOrganizationRequest(
      title: json['title'] as String,
      nickname: json['nickname'] as String,
      secretCode: json['secret_code'] as String,
    );

Map<String, dynamic> _$CreateOrganizationRequestToJson(
        CreateOrganizationRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'nickname': instance.nickname,
      'secret_code': instance.secretCode,
    };
