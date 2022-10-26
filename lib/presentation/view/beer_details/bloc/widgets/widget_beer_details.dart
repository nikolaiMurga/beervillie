import 'package:beerville_flutter/presentation/base/widget_beer_description.dart';
import 'package:beerville_flutter/presentation/base/widget_beer_info.dart';
import 'package:beerville_flutter/presentation/base/widget_image_item.dart';
import 'package:beerville_flutter/presentation/base/widget_progress_indicator.dart';
import 'package:beerville_flutter/presentation/res/beer_strings.dart';
import 'package:beerville_flutter/presentation/res/beer_text_styles.dart';
import 'package:beerville_flutter/presentation/view/beer_card/beer_card.dart';
import 'package:beerville_flutter/presentation/view/beer_details/bloc/details_page_bloc.dart';
import 'package:beerville_flutter/presentation/view/beer_details/bloc/details_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetBeerDetails extends StatelessWidget {
  const WidgetBeerDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsPageBloc, DetailsPageState>(
      builder: (context, state) {
        if (state is LoadingDetailsPageState) {
          return WidgetProgressIndicator();
        }
        if (state is ShowDetailsPageState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 17, top: 23),
                        child: Row(
                          children: [
                            Expanded(child: WidgetImageItem(beer: state.beer)),
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
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0, bottom: 10),
                      child: Text(
                        BeerStrings.lookAlso,
                        style: BeerTextStyles.mainText,
                      ),
                    ),
                    BeerCard(state.customBeer),
                  ],
                ),
              ),
            ],
          );
        }
        if (state is ErrorDetailsPageState) {
          return Center(
            child: Text(
              BeerStrings.noData,
              style: BeerTextStyles.mainText,
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
