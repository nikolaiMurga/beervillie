import 'package:beerville_flutter/data/api/response/beer_response.dart';

abstract class BeerRemoteRepository {
  Future<List<BeerResponse>> fetchBeers(int page);

  Future<List<BeerResponse>> fetchRandomBeer();

  Future<List<BeerResponse>> fetchParameterizedBeer(double ibu, double abv);
}
