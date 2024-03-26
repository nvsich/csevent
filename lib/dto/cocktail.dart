import 'package:json_annotation/json_annotation.dart';
import 'enum/cocktail_type.dart';

part 'cocktail.g.dart';

@JsonSerializable()
class Cocktail {
  final String id;
  final String name;
  final CocktailType type;
  @JsonKey(name: 'event_id')
  final String eventId;

  Cocktail({
    required this.id,
    required this.name,
    required this.type,
    required this.eventId,
  });

  factory Cocktail.fromJson(Map<String, dynamic> json) => _$CocktailFromJson(json);

  Map<String, dynamic> toJson() => _$CocktailToJson(this);
}
