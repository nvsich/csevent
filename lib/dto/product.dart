import 'package:json_annotation/json_annotation.dart';
import 'enum/product_tag.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final String id;
  final String name;
  final String unit;
  @JsonKey(name: 'organization_id')
  final String organizationId;
  final ProductTag tag;

  Product({
    required this.id,
    required this.name,
    required this.unit,
    required this.organizationId,
    required this.tag,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
