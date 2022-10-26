import 'package:beerville_flutter/presentation/res/beer_colors.dart';
import 'package:flutter/material.dart';

class WidgetProgressIndicator extends StatelessWidget {
  const WidgetProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(BeerColors.black),
      ),
    );
  }
}
