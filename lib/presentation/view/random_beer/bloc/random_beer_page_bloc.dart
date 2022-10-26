import 'package:beerville_flutter/app/locator.dart';
import 'package:beerville_flutter/domain/beer_repository.dart';
import 'package:beerville_flutter/domain/models/beer.dart';
import 'package:beerville_flutter/presentation/view/random_beer/bloc/random_beer_page_event.dart';
import 'package:beerville_flutter/presentation/view/random_beer/bloc/random_beer_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RandomBeerPageBloc
    extends Bloc<RandomBeerPageEvent, RandomBeerPageState> {
  final BeerRepository _repository = locator<BeerRepository>();

  RandomBeerPageBloc() : super(InitialRandomBeerPageState());

  @override
  Stream<RandomBeerPageState> mapEventToState(
      RandomBeerPageEvent event) async* {
    if (event is ShowRandomBeerPageEvent) {
      try {
        Beer? beer = await _repository.getRandomBeer();
        if (beer != null) {
          yield ShowRandomBeerPageState(beer);
        } else {
          yield ErrorRandomBeerPageState(); //TODO: Handle this error in UI
        }
      } catch (error, stacktrace) {
        yield ErrorRandomBeerPageState(); //TODO: Handle this error in UI
        print(error);
        print(stacktrace);
      }
    }

    if (event is CloseRandomBeerPageEvent) {
      yield InitialRandomBeerPageState();
    }
  }
}
