import 'package:json_annotation/json_annotation.dart';
import 'short_warehouse_response_with_amount.dart';

part 'product_with_warehouses_response.g.dart';

@JsonSerializable()
class ProductWithWarehousesResponse {
  final String id;
  final String name;
  final String unit;
  final List<ShortWarehouseResponseWithAmount> warehouses;

  ProductWithWarehousesResponse({
    required this.id,
    required this.name,
    required this.unit,
    required this.warehouses,
  });

  factory ProductWithWarehousesResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductWithWarehousesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductWithWarehousesResponseToJson(this);
}
