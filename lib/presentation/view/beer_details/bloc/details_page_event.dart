import 'package:beerville_flutter/domain/models/beer.dart';

abstract class DetailsPageEvent {}

class LoadingDetailsPageEvent extends DetailsPageEvent {
  final Beer beer;

  LoadingDetailsPageEvent(this.beer);
}
