import 'package:beerville_flutter/presentation/base/button_main.dart';
import 'package:beerville_flutter/presentation/base/widget_beer_description.dart';
import 'package:beerville_flutter/presentation/base/widget_beer_info.dart';
import 'package:beerville_flutter/presentation/base/widget_image_item.dart';
import 'package:beerville_flutter/presentation/res/beer_colors.dart';
import 'package:beerville_flutter/presentation/res/beer_strings.dart';
import 'package:beerville_flutter/presentation/res/beer_text_styles.dart';
import 'package:beerville_flutter/presentation/view/random_beer/bloc/random_beer_page_bloc.dart';
import 'package:beerville_flutter/presentation/view/random_beer/bloc/random_beer_page_event.dart';
import 'package:beerville_flutter/presentation/view/random_beer/bloc/random_beer_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetRandomBeerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RandomBeerPageBloc _randomBeerPageBloc =
        BlocProvider.of<RandomBeerPageBloc>(context);
    return BlocBuilder<RandomBeerPageBloc, RandomBeerPageState>(
      builder: (context, state) {
        if (state is ShowRandomBeerPageState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: BeerColors.white,
              centerTitle: true,
              title: Container(
                child: Text(
                  BeerStrings.randomBeer,
                  style: BeerTextStyles.randomBeer,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.73),
                  child: GestureDetector(
                    child: Icon(Icons.close, color: BeerColors.unselected),
                    onTap: () =>
                        _randomBeerPageBloc.add(CloseRandomBeerPageEvent()),
                  ),
                ),
              ],
              elevation: 0,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 17),
                          child: Row(
                            children: [
                              Expanded(
                                  child: WidgetImageItem(beer: state.beer)),
                              WidgetBeerInfo(beer: state.beer),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 19, right: 36),
                          child: WidgetBeerDescription(beer: state.beer),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: 28, left: 16, right: 16, top: 16),
                  child: ButtonMain(
                    text: BeerStrings.randomAnother,
                    onTap: () =>
                        _randomBeerPageBloc.add(ShowRandomBeerPageEvent()),
                  ),
                ),
              ],
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
