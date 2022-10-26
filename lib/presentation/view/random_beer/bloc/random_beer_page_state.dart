import 'package:beerville_flutter/domain/models/beer.dart';

abstract class RandomBeerPageState {}

class InitialRandomBeerPageState extends RandomBeerPageState {}

class ShowRandomBeerPageState extends RandomBeerPageState {
  final Beer beer;

  ShowRandomBeerPageState(this.beer);
}

class ErrorRandomBeerPageState extends RandomBeerPageState {}
