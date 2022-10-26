import 'package:beerville_flutter/data/db/entity/beer_item_data.dart';

abstract class BeerLocalRepository {
  Future<void> updateBeers(List<BeerItemData> itemDataList);

  Future<List<BeerItemData>> getBeers();
}
