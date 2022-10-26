// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeerResponse _$BeerResponseFromJson(Map<String, dynamic> json) => BeerResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      firstBrewed: json['first_brewed'] as String,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String?,
      abv: (json['abv'] as num?)?.toDouble(),
      ibu: (json['ibu'] as num?)?.toDouble(),
      ebc: (json['ebc'] as num?)?.toDouble(),
      ingredients:
          Ingredients.fromJson(json['ingredients'] as Map<String, dynamic>),
      foodPairing: (json['food_pairing'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$BeerResponseToJson(BeerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'first_brewed': instance.firstBrewed,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'abv': instance.abv,
      'ibu': instance.ibu,
      'ebc': instance.ebc,
      'ingredients': instance.ingredients,
      'food_pairing': instance.foodPairing,
    };

Ingredients _$IngredientsFromJson(Map<String, dynamic> json) => Ingredients(
      malt: (json['malt'] as List<dynamic>)
          .map((e) => Malt.fromJson(e as Map<String, dynamic>))
          .toList(),
      hops: (json['hops'] as List<dynamic>)
          .map((e) => Hops.fromJson(e as Map<String, dynamic>))
          .toList(),
      yeast: json['yeast'] as String,
    );

Map<String, dynamic> _$IngredientsToJson(Ingredients instance) =>
    <String, dynamic>{
      'malt': instance.malt,
      'hops': instance.hops,
      'yeast': instance.yeast,
    };

Malt _$MaltFromJson(Map<String, dynamic> json) => Malt(
      name: json['name'] as String,
      amount: Amount.fromJson(json['amount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MaltToJson(Malt instance) => <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
    };

Amount _$AmountFromJson(Map<String, dynamic> json) => Amount(
      value: (json['value'] as num).toDouble(),
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$AmountToJson(Amount instance) => <String, dynamic>{
      'value': instance.value,
      'unit': instance.unit,
    };

Hops _$HopsFromJson(Map<String, dynamic> json) => Hops(
      name: json['name'] as String,
      amount: Amount.fromJson(json['amount'] as Map<String, dynamic>),
      add: json['add'] as String,
      attribute: json['attribute'] as String,
    );

Map<String, dynamic> _$HopsToJson(Hops instance) => <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
      'add': instance.add,
      'attribute': instance.attribute,
    };
