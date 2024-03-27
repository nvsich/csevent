import 'package:json_annotation/json_annotation.dart';
import 'enum/cocktail_type.dart';

part 'create_or_update_cocktail_request.g.dart';

@JsonSerializable()
class CreateOrUpdateCocktailRequest {
  final String name;
  final CocktailType type;

  CreateOrUpdateCocktailRequest({
    required this.name,
    required this.type,
  });

  factory CreateOrUpdateCocktailRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateOrUpdateCocktailRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrUpdateCocktailRequestToJson(this);
}
