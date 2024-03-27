import 'package:json_annotation/json_annotation.dart';

part 'shopping_item_info_response.g.dart';

@JsonSerializable()
class ShoppingItemInfoResponse {
  @JsonKey(name: 'product_id')
  final String productId;
  final String name;
  final String unit;
  @JsonKey(name: 'total_amount')
  final double totalAmount;
  @JsonKey(name: 'to_buy_amount')
  final double toBuyAmount;
  final double price;

  ShoppingItemInfoResponse({
    required this.productId,
    required this.name,
    required this.unit,
    required this.totalAmount,
    required this.toBuyAmount,
    required this.price,
  });

  factory ShoppingItemInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$ShoppingItemInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShoppingItemInfoResponseToJson(this);
}
