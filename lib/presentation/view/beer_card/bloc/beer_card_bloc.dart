import 'package:beerville_flutter/presentation/view/beer_card/bloc/beer_card_event.dart';
import 'package:beerville_flutter/presentation/view/beer_card/bloc/beer_card_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeerCardBloc extends Bloc<BeerCardEvent, BeerCardState> {
  BeerCardBloc() : super(InitialBeerCardState());

  @override
  Stream<BeerCardState> mapEventToState(BeerCardEvent event) async* {
    if (event is LoadingBeerCardEvent) {
      yield LoadedBeerCardState(event.beer);
    }
  }
}
