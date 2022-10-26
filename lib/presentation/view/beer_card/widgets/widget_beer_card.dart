import 'package:beerville_flutter/app/locator.dart';
import 'package:beerville_flutter/domain/navigation/navigation.dart';
import 'package:beerville_flutter/presentation/res/beer_colors.dart';
import 'package:beerville_flutter/presentation/res/beer_strings.dart';
import 'package:beerville_flutter/presentation/res/beer_text_styles.dart';
import 'package:beerville_flutter/presentation/tools/global_variables.dart';
import 'package:beerville_flutter/presentation/view/beer_card/bloc/beer_card_bloc.dart';
import 'package:beerville_flutter/presentation/view/beer_card/bloc/beer_card_state.dart';
import 'package:beerville_flutter/presentation/view/beer_details/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetBeerCard extends StatelessWidget {
  final Navigation _navigation = locator<Navigation>();

  WidgetBeerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeerCardBloc, BeerCardState>(
      builder: (context, state) {
        if (state is LoadedBeerCardState) {
          return GestureDetector(
            onTap: () => _navigation.push(context, DetailsPage(beer: state.beer)),
            child: Container(
              height: (104 * GlobalVariables.heightCof).roundToDouble(),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.1)),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Container(
                      decoration: BoxDecoration(color: BeerColors.grey, borderRadius: BorderRadius.circular(5)),
                      height: (104 * GlobalVariables.heightCof).roundToDouble(),
                      width: 84,
                      child: state.beer.imageUrl != null
                          ? FadeInImage.assetNetwork(
                              image: state.beer.imageUrl!,
                              placeholder: 'lib/presentation/res/drawable/loader.gif',
                              placeholderCacheHeight: 50,
                              placeholderCacheWidth: 50,
                            )
                          : Image.asset('lib/presentation/res/drawable/beer_sample.png')),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 13.0, left: 19),
                        child: Container(
                          height: (40 * GlobalVariables.heightCof).roundToDouble(),
                          width: (222 * GlobalVariables.heightCof).roundToDouble(),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(state.beer.name, style: BeerTextStyles.mainText),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 5),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(BeerStrings.ibu + '${state.beer.ibu}', style: BeerTextStyles.params),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(BeerStrings.abv + '${state.beer.abv}', style: BeerTextStyles.params),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
