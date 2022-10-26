import 'package:beerville_flutter/domain/models/beer.dart';

abstract class BeerCardEvent {}

class LoadingBeerCardEvent extends BeerCardEvent {
  final Beer beer;

  LoadingBeerCardEvent(this.beer);
}
