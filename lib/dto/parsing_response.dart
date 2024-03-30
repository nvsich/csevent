import 'package:json_annotation/json_annotation.dart';

part 'parsing_response.g.dart';

@JsonSerializable()
class ParsingResponse {
  final String shop;
  final String price;
  final String url;
  final bool founded;

  ParsingResponse({
    required this.shop,
    required this.price,
    required this.url,
    required this.founded,
  });

  factory ParsingResponse.fromJson(Map<String, dynamic> json) => _$ParsingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ParsingResponseToJson(this);
}
