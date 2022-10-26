import 'package:beerville_flutter/presentation/view/favourite/favourite_page.dart';
import 'package:beerville_flutter/presentation/view/main/main_page.dart';
import 'package:beerville_flutter/presentation/view/search/search_page.dart';
import 'package:beerville_flutter/presentation/view/settings/settings_page.dart';
import 'package:flutter/widgets.dart';

abstract class NavigationPageState {
  abstract Widget page;
}

class MainPageNavigationState extends NavigationPageState {
  final _page = MainPage();

  @override
  set page(Widget _page) => _page;

  @override
  Widget get page => _page;
}

class SearchPageNavigationState extends NavigationPageState {
  final _page = SearchPage();

  @override
  set page(Widget _page) => _page;

  @override
  Widget get page => _page;
}

class FavouritePageNavigationState extends NavigationPageState {
  final _page = FavouritePage();

  @override
  set page(Widget _page) => _page;

  @override
  Widget get page => _page;
}

class SettingsPageNavigationState extends NavigationPageState {
  final _page = SettingsPage();

  @override
  set page(Widget _page) => _page;

  @override
  Widget get page => _page;
}
