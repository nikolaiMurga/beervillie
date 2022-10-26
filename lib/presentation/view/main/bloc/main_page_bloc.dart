import 'package:beerville_flutter/app/locator.dart';
import 'package:beerville_flutter/domain/beer_repository.dart';
import 'package:beerville_flutter/domain/models/beer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_page_event.dart';
import 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(EmptyMainPageState());

  final BeerRepository _repositoryImpl = locator<BeerRepository>();

  int page = 1;

  @override
  Stream<MainPageState> mapEventToState(MainPageEvent event) async* {
    switch (event.runtimeType) {
      case (LoadBeersEvent):
        yield* _loadList();
        break;
      case (NextPageScrollEvent):
        page += 1;
        yield* _loadList();
        break;
      case (PreviousPageScrollEvent):
        page -= 1;
        if (page == 0) {
          page = 1;
          return;
        } else {
          yield* _loadList();
        }
        break;
    }
  }

  Stream<MainPageState> _loadList() async* {
    yield LoadingMainPageState();
    try {
      final List<Beer> _loadedList = await _repositoryImpl.getBeers(page);
      yield LoadedMainPageState(beerList: _loadedList);
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      yield ErrorMainPageState();
    }
  }
}
