import 'package:beerville_flutter/app/locator.dart';
import 'package:beerville_flutter/data/api/beers_api.dart';
import 'package:beerville_flutter/data/api/response/beer_response.dart';
import 'package:beerville_flutter/domain/beer_remote_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BeerRemoteRepository)
class BeerRemoteRepositoryImpl extends BeerRemoteRepository {
  final BeersApi _remote = locator<BeersApi>();

  @override
  Future<List<BeerResponse>> fetchBeers(int page) => _remote.fetchBeers(page);

  @override
  Future<List<BeerResponse>> fetchRandomBeer() => _remote.fetchRandomBeer();

  @override
  Future<List<BeerResponse>> fetchParameterizedBeer(double ibu, double abv) => _remote.fetchParameterizedBeer(ibu, abv);
}
