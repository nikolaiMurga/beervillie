import 'package:beerville_flutter/presentation/res/beer_colors.dart';
import 'package:beerville_flutter/presentation/res/beer_text_styles.dart';
import 'package:beerville_flutter/presentation/tools/global_variables.dart';
import 'package:flutter/material.dart';

class ButtonMain extends StatelessWidget {
  final String text;
  final Function onTap;

  ButtonMain({
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: double.maxFinite,
        height: (44 * GlobalVariables.heightCof).roundToDouble(),
        decoration: BoxDecoration(
          color: BeerColors.black,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            text,
            style: BeerTextStyles.mainButtonText,
          ),
        ),
      ),
    );
  }
}
