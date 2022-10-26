import 'package:json_annotation/json_annotation.dart';

part 'beer_response.g.dart';

@JsonSerializable()
class BeerResponse {
  final int id;
  final String name;
  @JsonKey(name: 'first_brewed')
  final String firstBrewed;
  final String description;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  final double? abv;
  final double? ibu;
  final double? ebc;
  final Ingredients ingredients;
  @JsonKey(name: 'food_pairing')
  final List<String> foodPairing;

  BeerResponse({
    required this.id,
    required this.name,
    required this.firstBrewed,
    required this.description,
    this.imageUrl,
    this.abv,
    this.ibu,
    this.ebc,
    required this.ingredients,
    required this.foodPairing,
  });

  factory BeerResponse.fromJson(Map<String, dynamic> json) =>
      _$BeerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BeerResponseToJson(this);
}

@JsonSerializable()
class Ingredients {
  final List<Malt> malt;
  final List<Hops> hops;
  String yeast;

  Ingredients({
    required this.malt,
    required this.hops,
    required this.yeast,
  });

  factory Ingredients.fromJson(Map<String, dynamic> json) =>
      _$IngredientsFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientsToJson(this);
}

@JsonSerializable()
class Malt {
  final String name;
  final Amount amount;

  Malt({
    required this.name,
    required this.amount,
  });

  factory Malt.fromJson(Map<String, dynamic> json) => _$MaltFromJson(json);

  Map<String, dynamic> toJson() => _$MaltToJson(this);
}

@JsonSerializable()
class Amount {
  final double value;
  final String unit;

  Amount({
    required this.value,
    required this.unit,
  });

  factory Amount.fromJson(Map<String, dynamic> json) => _$AmountFromJson(json);

  Map<String, dynamic> toJson() => _$AmountToJson(this);
}

@JsonSerializable()
class Hops {
  final String name;
  final Amount amount;
  final String add;
  final String attribute;

  Hops({
    required this.name,
    required this.amount,
    required this.add,
    required this.attribute,
  });

  factory Hops.fromJson(Map<String, dynamic> json) => _$HopsFromJson(json);

  Map<String, dynamic> toJson() => _$HopsToJson(this);
}
