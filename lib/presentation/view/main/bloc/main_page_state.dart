import 'package:beerville_flutter/domain/models/beer.dart';

abstract class MainPageState {}

class EmptyMainPageState extends MainPageState {}

class LoadingMainPageState extends MainPageState {}

class LoadedMainPageState extends MainPageState {
  List<Beer> beerList;

  LoadedMainPageState({required this.beerList});
}

class ErrorMainPageState extends MainPageState {}
