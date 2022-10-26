import 'package:beerville_flutter/data/db/entity/beer_item_data.dart';

class Beer {
  final int id;
  final String name;
  final String firstBrewed;
  final String description;
  final String? imageUrl;
  final double? abv;
  final double? ibu;
  final double? ebc;
  final String hops;
  final String malt;
  final String foodPairing;

  Beer({
    required this.id,
    required this.name,
    required this.firstBrewed,
    required this.description,
    this.imageUrl,
    this.abv,
    this.ibu,
    this.ebc,
    required this.hops,
    required this.malt,
    required this.foodPairing,
  });

  factory Beer.fromItemData(BeerItemData itemData) => Beer(
        id: itemData.id,
        name: itemData.name,
        firstBrewed: itemData.firstBrewed,
        description: itemData.description,
        imageUrl: itemData.imageUrl,
        abv: itemData.abv,
        ibu: itemData.ibu,
        ebc: itemData.ebc,
        hops: itemData.hops,
        malt: itemData.malt,
        foodPairing: itemData.foodPairing,
      );
}
