// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_and_filter_product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchAndFilterProductRequest _$SearchAndFilterProductRequestFromJson(
        Map<String, dynamic> json) =>
    SearchAndFilterProductRequest(
      substring: json['substring'] as String,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => $enumDecode(_$ProductTagEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$SearchAndFilterProductRequestToJson(
        SearchAndFilterProductRequest instance) =>
    <String, dynamic>{
      'substring': instance.substring,
      'tags': instance.tags.map((e) => _$ProductTagEnumMap[e]!).toList(),
    };

const _$ProductTagEnumMap = {
  ProductTag.STRONG_ALCO: 'STRONG_ALCO',
  ProductTag.LIGHT_ALCO: 'LIGHT_ALCO',
  ProductTag.NON_ALCO: 'NON_ALCO',
  ProductTag.SYRUP: 'SYRUP',
  ProductTag.FOOD: 'FOOD',
  ProductTag.EQUIPMENT: 'EQUIPMENT',
};
