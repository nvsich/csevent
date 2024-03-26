import 'package:json_annotation/json_annotation.dart';
import 'ingredient.dart';
import 'enum/cocktail_type.dart';

part 'cocktail_with_ingredients_response.g.dart';

@JsonSerializable()
class CocktailWithIngredientsResponse {
  final String id;
  final String name;
  final CocktailType type;
  final List<Ingredient> ingredients;

  CocktailWithIngredientsResponse({
    required this.id,
    required this.name,
    required this.type,
    required this.ingredients,
  });

  factory CocktailWithIngredientsResponse.fromJson(Map<String, dynamic> json) =>
      _$CocktailWithIngredientsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CocktailWithIngredientsResponseToJson(this);
}
