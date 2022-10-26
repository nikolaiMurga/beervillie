import 'package:beerville_flutter/data/api/endpoints.dart';
import 'package:beerville_flutter/data/api/response/beer_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'beers_api.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class BeersApi {
  factory BeersApi(Dio dio) = _BeersApi;

  @GET(Endpoints.beersList + '{page}')
  Future<List<BeerResponse>> fetchBeers(@Path('page') int page);

  @GET(Endpoints.randomBeer)
  Future<List<BeerResponse>> fetchRandomBeer();

  @GET(Endpoints.parameterizedBeerIbu +
      '{ibu}' +
      Endpoints.parameterizedBeerAbv +
      '{abv}')
  Future<List<BeerResponse>> fetchParameterizedBeer(
    @Path('ibu') double ibu,
    @Path('abv') double abv,
  );
}
