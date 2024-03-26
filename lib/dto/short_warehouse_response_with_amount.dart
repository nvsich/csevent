import 'package:json_annotation/json_annotation.dart';

part 'short_warehouse_response_with_amount.g.dart';

@JsonSerializable()
class ShortWarehouseResponseWithAmount {
  final String id;
  final String name;
  final String address;
  final double amount;

  ShortWarehouseResponseWithAmount({
    required this.id,
    required this.name,
    required this.address,
    required this.amount,
  });

  factory ShortWarehouseResponseWithAmount.fromJson(Map<String, dynamic> json) =>
      _$ShortWarehouseResponseWithAmountFromJson(json);

  Map<String, dynamic> toJson() => _$ShortWarehouseResponseWithAmountToJson(this);
}
