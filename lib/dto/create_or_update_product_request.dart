import 'package:json_annotation/json_annotation.dart';
import 'enum/product_tag.dart';

part 'create_or_update_product_request.g.dart';

@JsonSerializable()
class CreateOrUpdateProductRequest {
  final String name;
  final String unit;
  final double amount;
  final ProductTag tag;

  CreateOrUpdateProductRequest({
    required this.name,
    required this.unit,
    required this.amount,
    required this.tag,
  });

  factory CreateOrUpdateProductRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateOrUpdateProductRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrUpdateProductRequestToJson(this);
}
