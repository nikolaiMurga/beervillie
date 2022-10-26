import 'package:beerville_flutter/domain/models/beer.dart';
import 'package:beerville_flutter/presentation/res/beer_text_styles.dart';
import 'package:flutter/material.dart';

class WidgetBeerInfo extends StatelessWidget {
  final Beer beer;
  const WidgetBeerInfo({Key? key, required this.beer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              width: 230,
              child: Text(
                beer.name.toUpperCase(),
                style: BeerTextStyles.mainText,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Container(
              width: 230,
              child: Text(
                'Malt   ' + beer.malt,
                style: BeerTextStyles.randomBeer,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Text(
              'Hops   ' + beer.hops,
              style: BeerTextStyles.randomBeer,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Text(
              beer.ibu != null ? 'IBU   ' + beer.ibu.toString() : 'IBU   ?',
              style: BeerTextStyles.randomBeer,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Text(
              beer.abv != null ? 'ABV   ' + beer.abv.toString() : 'ABV   ?',
              style: BeerTextStyles.randomBeer,
            ),
          ),
          Text(
            beer.ebc != null ? 'EBC   ' + beer.ebc.toString() : 'EBC   ?',
            style: BeerTextStyles.randomBeer,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: GestureDetector(
              onTap: () => {},
              child: Text(
                'Add to favourite',
                style: BeerTextStyles.mainText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
