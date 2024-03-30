// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parsing_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParsingResponse _$ParsingResponseFromJson(Map<String, dynamic> json) =>
    ParsingResponse(
      shop: json['shop'] as String,
      price: json['price'] as String,
      url: json['url'] as String,
      founded: json['founded'] as bool,
    );

Map<String, dynamic> _$ParsingResponseToJson(ParsingResponse instance) =>
    <String, dynamic>{
      'shop': instance.shop,
      'price': instance.price,
      'url': instance.url,
      'founded': instance.founded,
    };
