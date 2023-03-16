import 'package:beerville_flutter/presentation/base/button_main.dart';
import 'package:beerville_flutter/presentation/res/beer_strings.dart';
import 'package:beerville_flutter/presentation/tools/build_context_extensions.dart';
import 'package:beerville_flutter/presentation/view/main/widgets/widget_all_beers.dart';
import 'package:beerville_flutter/presentation/view/main/widgets/widget_beers_list.dart';
import 'package:beerville_flutter/presentation/view/main/widgets/widget_main_page_appbar.dart';
import 'package:beerville_flutter/presentation/view/random_beer/bloc/random_beer_page_bloc.dart';
import 'package:beerville_flutter/presentation/view/random_beer/bloc/random_beer_page_event.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  static final MainPage _mainPage = MainPage._internal();

  factory MainPage() => _mainPage;

  MainPage._internal();

  @override
  Widget build(BuildContext context) {
    final RandomBeerPageBloc _randomBeerPageBloc = context.bloc<RandomBeerPageBloc>();

    return Scaffold(
      appBar: AppBarMain(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ButtonMain(text: BeerStrings.suggestMeABeer, onTap: () => _randomBeerPageBloc.add(ShowRandomBeerPageEvent())),
          ),
          Padding(padding: const EdgeInsets.only(left: 17.0), child: Align(alignment: Alignment.centerLeft, child: WidgetAllBeers())),
          Expanded(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15), child: WidgetBeersList())),
        ],
      ),
    );
  }
}
