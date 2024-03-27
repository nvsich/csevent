import 'package:json_annotation/json_annotation.dart';

part 'create_warehouse_request.g.dart';

@JsonSerializable()
class CreateWarehouseRequest {
  final String name;
  final String address;

  CreateWarehouseRequest({
    required this.name,
    required this.address,
  });

  factory CreateWarehouseRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateWarehouseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateWarehouseRequestToJson(this);
}
