import 'package:beerville_flutter/data/api/response/beer_response.dart';
import 'package:floor/floor.dart';

@Entity(tableName: '_beer')
class BeerItemData {
  @primaryKey
  final int id;
  final String name;
  @ColumnInfo(name: 'first_brewed')
  final String firstBrewed;
  final String description;
  @ColumnInfo(name: 'image_url')
  final String? imageUrl;
  final double? abv;
  final double? ibu;
  final double? ebc;
  final String hops;
  final String malt;
  @ColumnInfo(name: 'food_pairing')
  final String foodPairing;

  BeerItemData({
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

  factory BeerItemData.fromResponse(BeerResponse response) => BeerItemData(
        id: response.id,
        name: response.name,
        firstBrewed: response.firstBrewed,
        description: response.description,
        imageUrl: response.imageUrl,
        abv: response.abv,
        ibu: response.ibu,
        ebc: response.ebc,
        hops: response.ingredients.hops.first.name,
        malt: response.ingredients.malt.first.name,
        foodPairing: response.foodPairing.toString(),
      );
}
