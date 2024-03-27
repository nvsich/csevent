import 'package:json_annotation/json_annotation.dart';
import 'enum/product_tag.dart';

part 'ingredient.g.dart';

@JsonSerializable()
class Ingredient {
  @JsonKey(name: 'product_id')
  final String productId;
  final String name;
  final ProductTag tag;
  final double amount;

  Ingredient({
    required this.productId,
    required this.name,
    required this.tag,
    required this.amount,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}
