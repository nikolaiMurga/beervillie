import 'package:beerville_flutter/data/api/beers_api.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ApiModule {
  @lazySingleton
  BeersApi get beersApi {
    Dio dio = Dio();
    //TODO implement changes of new version of library. Does'nt work.
    // dio.interceptors.add(LoggingInterceptor());
    return BeersApi(dio);
  }
}
