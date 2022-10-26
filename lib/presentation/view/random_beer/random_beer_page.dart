import 'package:beerville_flutter/presentation/tools/global_variables.dart';
import 'package:beerville_flutter/presentation/view/random_beer/widgets/widget_random_beer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/random_beer_page_bloc.dart';
import 'bloc/random_beer_page_state.dart';

class RandomBeerPage extends StatelessWidget {
  static final RandomBeerPage _randomBeerPage = RandomBeerPage._internal();

  factory RandomBeerPage() {
    return _randomBeerPage;
  }

  RandomBeerPage._internal();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomBeerPageBloc, RandomBeerPageState>(
      builder: (context, state) {
        if (state is InitialRandomBeerPageState) {
          return AnimatedContainer(
            alignment: Alignment.bottomCenter,
            duration: Duration(milliseconds: 250),
            height: 0.0,
            child: WidgetRandomBeerPage(),
          );
        }
        if (state is ShowRandomBeerPageState) {
          return AnimatedContainer(
            alignment: Alignment.bottomCenter,
            duration: Duration(milliseconds: 250),
            height: (684 * GlobalVariables.heightCof).roundToDouble(),
            child: WidgetRandomBeerPage(),
          );
        }

        return Text('No Data');
      },
    );
  }
}
