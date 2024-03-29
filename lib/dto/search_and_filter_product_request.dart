import 'package:json_annotation/json_annotation.dart';
import 'package:csevent/dto/enum/product_tag.dart';

part 'search_and_filter_product_request.g.dart';

@JsonSerializable()
class SearchAndFilterProductRequest {
  final String substring;
  final List<ProductTag> tags;

  SearchAndFilterProductRequest({required this.substring, required this.tags});

  factory SearchAndFilterProductRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchAndFilterProductRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SearchAndFilterProductRequestToJson(this);
}
