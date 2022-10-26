import 'package:beerville_flutter/domain/models/beer.dart';
import 'package:beerville_flutter/presentation/res/beer_strings.dart';
import 'package:beerville_flutter/presentation/res/beer_text_styles.dart';
import 'package:flutter/material.dart';

class WidgetBeerDescription extends StatelessWidget {
  final Beer beer;
  const WidgetBeerDescription({Key? key, required this.beer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          BeerStrings.description,
          style: BeerTextStyles.mainText,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            beer.description,
            style: BeerTextStyles.bottomLabel,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            BeerStrings.food,
            style: BeerTextStyles.mainText,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            beer.foodPairing,
            style: BeerTextStyles.bottomLabel,
          ),
        ),
      ],
    );
  }
}
