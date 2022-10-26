// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/api/beers_api.dart' as _i9;
import '../data/db/beers_database.dart' as _i10;
import '../data/repository/beer_local_repository_impl.dart' as _i4;
import '../data/repository/beer_remote_repository_impl.dart' as _i6;
import '../data/repository/beer_repository_impl.dart' as _i8;
import '../di/api_module.dart' as _i12;
import '../di/database_module.dart' as _i13;
import '../domain/beer_local_repository.dart' as _i3;
import '../domain/beer_remote_repository.dart' as _i5;
import '../domain/beer_repository.dart' as _i7;
import '../domain/navigation/navigation.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final apiModule = _$ApiModule();
  final databaseModule = _$DatabaseModule();
  gh.lazySingleton<_i3.BeerLocalRepository>(
      () => _i4.BeerLocalRepositoryImpl());
  gh.lazySingleton<_i5.BeerRemoteRepository>(
      () => _i6.BeerRemoteRepositoryImpl());
  gh.lazySingleton<_i7.BeerRepository>(() => _i8.BeerRepositoryImpl());
  gh.lazySingleton<_i9.BeersApi>(() => apiModule.beersApi);
  await gh.factoryAsync<_i10.BeersDataBase>(() => databaseModule.database,
      preResolve: true);
  gh.lazySingleton<_i11.Navigation>(() => _i11.Navigation());
  return get;
}

class _$ApiModule extends _i12.ApiModule {}

class _$DatabaseModule extends _i13.DatabaseModule {}
