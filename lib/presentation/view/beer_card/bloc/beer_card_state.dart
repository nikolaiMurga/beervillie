import 'package:beerville_flutter/domain/models/beer.dart';

abstract class BeerCardState {}

class InitialBeerCardState extends BeerCardState {}

class LoadedBeerCardState extends BeerCardState {
  final Beer beer;

  LoadedBeerCardState(this.beer);
}
