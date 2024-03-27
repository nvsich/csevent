import 'package:json_annotation/json_annotation.dart';

part 'warehouse.g.dart';

@JsonSerializable()
class Warehouse {
  final String id;
  final String name;
  final String address;
  @JsonKey(name: 'organization_id')
  final String organizationId;

  Warehouse({
    required this.id,
    required this.name,
    required this.address,
    required this.organizationId
  });

  factory Warehouse.fromJson(Map<String, dynamic> json) => _$WarehouseFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseToJson(this);
}
