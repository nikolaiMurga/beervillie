import 'package:beerville_flutter/data/db/beers_database.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DatabaseModule {
  @preResolve
  Future<BeersDataBase> get database =>
      $FloorBeersDataBase.databaseBuilder('beers_database.db').build();
}
