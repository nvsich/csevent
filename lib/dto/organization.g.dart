// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Organization _$OrganizationFromJson(Map<String, dynamic> json) => Organization(
      id: json['id'] as String,
      title: json['title'] as String,
      nickname: json['nickname'] as String,
      secretCode: json['secret_code'] as String,
    );

Map<String, dynamic> _$OrganizationToJson(Organization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'nickname': instance.nickname,
      'secret_code': instance.secretCode,
    };
