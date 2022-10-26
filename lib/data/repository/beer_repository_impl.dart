import 'package:beerville_flutter/app/locator.dart';
import 'package:beerville_flutter/data/db/entity/beer_item_data.dart';
import 'package:beerville_flutter/domain/beer_local_repository.dart';
import 'package:beerville_flutter/domain/beer_remote_repository.dart';
import 'package:beerville_flutter/domain/beer_repository.dart';
import 'package:beerville_flutter/domain/models/beer.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BeerRepository)
class BeerRepositoryImpl extends BeerRepository {
  final BeerRemoteRepository _remoteRepository =
      locator<BeerRemoteRepository>();
  final BeerLocalRepository _localRepository = locator<BeerLocalRepository>();

  Future<List<Beer>> getBeers(int page) async {
    List<Beer> beersList = [];
    try {
      final beersResponse = await _remoteRepository.fetchBeers(page);
      final beersItemData = beersResponse
          .map((beerResponse) => BeerItemData.fromResponse(beerResponse))
          .toList();
      await _localRepository.updateBeers(beersItemData);
      final resultList = await _localRepository.getBeers();

      beersList =
          resultList.map((itemData) => Beer.fromItemData(itemData)).toList();
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
    }

    return beersList;
  }

  Future<Beer?> getRandomBeer() async {
    Beer? beer;
    try {
      final beerResponse = await _remoteRepository.fetchRandomBeer();
      if (beerResponse.isNotEmpty) {
        final beersItemData = beerResponse
            .map((beerResponse) => BeerItemData.fromResponse(beerResponse));
        final list =
            beersItemData.map((itemData) => Beer.fromItemData(itemData));
        beer = list.first;
      }
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
    }

    return beer;
  }

  Future<Beer?> getParameterizedBeer(double? ibu, double? abv) async {
    Beer? beer;
    if (ibu != null && abv != null) {
      try {
        final beerResponse =
            await _remoteRepository.fetchParameterizedBeer(ibu, abv);
        if (beerResponse.isNotEmpty) {
          final beersItemData = beerResponse
              .map((beerResponse) => BeerItemData.fromResponse(beerResponse));
          final list =
              beersItemData.map((itemData) => Beer.fromItemData(itemData));
          beer = list.first;
        }
      } catch (error, stacktrace) {
        print(error);
        print(stacktrace);
      }
    }

    return beer;
  }
}
