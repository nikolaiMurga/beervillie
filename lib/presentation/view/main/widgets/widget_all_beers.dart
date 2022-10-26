import 'package:beerville_flutter/presentation/res/beer_strings.dart';
import 'package:beerville_flutter/presentation/res/beer_text_styles.dart';
import 'package:beerville_flutter/presentation/view/main/bloc/main_page_bloc.dart';
import 'package:beerville_flutter/presentation/view/main/bloc/main_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetAllBeers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageBloc, MainPageState>(
      builder: (context, state) {
        return Text(
          BeerStrings.totalBeers,
          style: BeerTextStyles.mainText,
        );
      },
    );
  }
}
