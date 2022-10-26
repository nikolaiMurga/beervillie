import 'package:beerville_flutter/domain/models/beer.dart';
import 'package:beerville_flutter/presentation/tools/global_variables.dart';
import 'package:flutter/material.dart';

class WidgetImageItem extends StatelessWidget {
  final Beer beer;

  const WidgetImageItem({Key? key, required this.beer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (300 * GlobalVariables.heightCof).roundToDouble(),
      width: (131 * GlobalVariables.wightCof).roundToDouble(),
      child: beer.imageUrl != null
          ? FadeInImage.assetNetwork(
              image: beer.imageUrl!,
              placeholder: 'lib/presentation/res/drawable/loader.gif',
              placeholderCacheHeight: 50,
              placeholderCacheWidth: 50,
            )
          : Image.asset('lib/presentation/res/drawable/beer_sample.png'),
    );
  }
}
