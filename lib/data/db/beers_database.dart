import 'dart:async';

import 'package:beerville_flutter/data/db/dao/beer_dao.dart';
import 'package:beerville_flutter/data/db/entity/beer_item_data.dart';
import 'package:floor/floor.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'beers_database.g.dart';

@Database(
  version: 1,
  entities: [BeerItemData],
)
abstract class BeersDataBase extends FloorDatabase {
  @preResolve
  BeerDao get beerDao;
}
