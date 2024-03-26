// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_organization_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInOrganizationRequest _$SignInOrganizationRequestFromJson(
        Map<String, dynamic> json) =>
    SignInOrganizationRequest(
      nickname: json['nickname'] as String,
      secretCode: json['secret_code'] as String,
    );

Map<String, dynamic> _$SignInOrganizationRequestToJson(
        SignInOrganizationRequest instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'secret_code': instance.secretCode,
    };
