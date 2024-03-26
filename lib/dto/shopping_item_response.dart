import 'package:json_annotation/json_annotation.dart';
import 'enum/product_tag.dart';

part 'shopping_item_response.g.dart';

@JsonSerializable()
class ShoppingItemResponse {
  @JsonKey(name: 'product_id')
  final String productId;
  final String name;
  final ProductTag tag;
  final String unit;
  final double amount;
  final double price;
  @JsonKey(name: 'is_purchased')
  final bool isPurchased;

  ShoppingItemResponse({
    required this.productId,
    required this.name,
    required this.tag,
    required this.unit,
    required this.amount,
    required this.price,
    required this.isPurchased,
  });

  factory ShoppingItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ShoppingItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShoppingItemResponseToJson(this);
}
