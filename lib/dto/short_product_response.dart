import 'package:json_annotation/json_annotation.dart';
import 'enum/product_tag.dart';

part 'short_product_response.g.dart';

@JsonSerializable()
class ShortProductResponse {
  final String id;
  final String name;
  final ProductTag tag;
  final String unit;
  final double amount;

  ShortProductResponse({
    required this.id,
    required this.name,
    required this.tag,
    required this.unit,
    required this.amount,
  });

  factory ShortProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ShortProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShortProductResponseToJson(this);
}
