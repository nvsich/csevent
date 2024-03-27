import 'package:json_annotation/json_annotation.dart';

part 'shopping_item_request.g.dart';

@JsonSerializable()
class ShoppingItemRequest {
  final double price;
  @JsonKey(name: 'to_buy_amount')
  final double toBuyAmount;

  ShoppingItemRequest({
    required this.price,
    required this.toBuyAmount,
  });

  factory ShoppingItemRequest.fromJson(Map<String, dynamic> json) =>
      _$ShoppingItemRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ShoppingItemRequestToJson(this);
}
