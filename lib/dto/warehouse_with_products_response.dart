import 'package:json_annotation/json_annotation.dart';
import 'short_product_response.dart';

part 'warehouse_with_products_response.g.dart';

@JsonSerializable()
class WarehouseWithProductsResponse {
  final String id;
  final String name;
  final List<ShortProductResponse> products;

  WarehouseWithProductsResponse({
    required this.id,
    required this.name,
    required this.products
  });

  factory WarehouseWithProductsResponse.fromJson(Map<String, dynamic> json) => _$WarehouseWithProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseWithProductsResponseToJson(this);
}
