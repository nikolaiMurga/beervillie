import 'package:beerville_flutter/data/db/entity/beer_item_data.dart';
import 'package:floor/floor.dart';

@dao
abstract class BeerDao {
  @insert
  Future<void> insertBeers(List<BeerItemData> beers);

  @Query('DELETE FROM _beer')
  Future<void> deleteBeers();

  @Query('SELECT * FROM _beer')
  Future<List<BeerItemData>> getBeers();

  @transaction
  Future<void> updateBeers(List<BeerItemData> beers) async {
    await deleteBeers();
    await insertBeers(beers);
  }
}
