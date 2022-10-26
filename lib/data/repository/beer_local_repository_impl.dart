import 'package:beerville_flutter/app/locator.dart';
import 'package:beerville_flutter/data/db/beers_database.dart';
import 'package:beerville_flutter/data/db/entity/beer_item_data.dart';
import 'package:beerville_flutter/domain/beer_local_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BeerLocalRepository)
class BeerLocalRepositoryImpl extends BeerLocalRepository {
  final BeersDataBase _dataBase = locator<BeersDataBase>();

  Future<void> updateBeers(List<BeerItemData> itemData) =>
      _dataBase.beerDao.updateBeers(itemData);

  Future<List<BeerItemData>> getBeers() => _dataBase.beerDao.getBeers();
}
