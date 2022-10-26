import 'package:beerville_flutter/domain/models/beer.dart';

abstract class DetailsPageState {}

class EmptyDetailsPageState extends DetailsPageState {}

class LoadingDetailsPageState extends DetailsPageState {}

class ShowDetailsPageState extends DetailsPageState {
  final Beer beer;
  final Beer customBeer;

  ShowDetailsPageState(this.beer, this.customBeer);
}

class ErrorDetailsPageState extends DetailsPageState {}
