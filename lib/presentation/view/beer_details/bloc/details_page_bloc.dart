import 'package:beerville_flutter/app/locator.dart';
import 'package:beerville_flutter/domain/beer_repository.dart';
import 'package:beerville_flutter/domain/models/beer.dart';
import 'package:beerville_flutter/presentation/view/beer_details/bloc/details_page_event.dart';
import 'package:beerville_flutter/presentation/view/beer_details/bloc/details_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPageBloc extends Bloc<DetailsPageEvent, DetailsPageState> {
  final BeerRepository _repository = locator<BeerRepository>();
  DetailsPageBloc() : super(EmptyDetailsPageState());

  @override
  Stream<DetailsPageState> mapEventToState(DetailsPageEvent event) async* {
    if (event is LoadingDetailsPageEvent) {
      yield LoadingDetailsPageState();
      try {
        Beer? parameterisedBeer = await _repository.getParameterizedBeer(
            event.beer.ibu, event.beer.abv);
        if (parameterisedBeer != null) {
          yield ShowDetailsPageState(event.beer, parameterisedBeer);
        } else {
          yield ErrorDetailsPageState();
        }
      } catch (error, stacktrace) {
        yield ErrorDetailsPageState();
        print(error);
        print(stacktrace);
      }
    }
  }
}
