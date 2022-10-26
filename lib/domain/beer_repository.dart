import 'package:beerville_flutter/domain/models/beer.dart';

abstract class BeerRepository {
  Future<List<Beer>> getBeers(int page);

  Future<Beer?> getRandomBeer();

  Future<Beer?> getParameterizedBeer(double? ibu, double? abv);
}
