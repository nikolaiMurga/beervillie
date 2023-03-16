import 'package:beerville_flutter/presentation/view/navigation/bloc/navigation_page_event.dart';
import 'package:beerville_flutter/presentation/view/navigation/bloc/navigation_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationPageBloc extends Bloc<NavigationPageEvent, NavigationPageState> {
  NavigationPageBloc() : super(MainPageNavigationState());

  @override
  Stream<NavigationPageState> mapEventToState(NavigationPageEvent event) async* {
    int index = event.toIndex();
    switch (index) {
      case 0:
        yield MainPageNavigationState();
        break;
      case 1:
        yield SearchPageNavigationState();
        break;
      case 2:
        yield FavouritePageNavigationState();
        break;
      case 3:
        yield SettingsPageNavigationState();
        break;
    }
  }
}


extension NavigationIndexesExtension on int {
  NavigationPageEvent toEvent() {
    switch (this) {
      case 0:
        return MainPageNavigationEvent();
      case 1:
        return SearchPageNavigationEvent();
      case 2:
        return FavouritePageNavigationEvent();
      default:
        return SettingsPageNavigationEvent();
    }
  }
}

extension NavigationEventToIndex on NavigationPageEvent {
  int toIndex() {
    if (this is MainPageNavigationEvent) {
      return 0;
    }
    if (this is SearchPageNavigationEvent) {
      return 1;
    }
    if (this is FavouritePageNavigationEvent) {
      return 2;
    }
    return 3;
  }
}

extension NavigationStateToIndex on NavigationPageState {
  int toIndex() {
    if (this is MainPageNavigationState) {
      return 0;
    }
    if (this is SearchPageNavigationState) {
      return 1;
    }
    if (this is FavouritePageNavigationState) {
      return 2;
    }
    return 3;
  }
}
