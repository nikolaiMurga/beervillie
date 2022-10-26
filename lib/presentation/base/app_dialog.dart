import 'package:beerville_flutter/presentation/res/beer_colors.dart';
import 'package:beerville_flutter/presentation/res/beer_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppDialog {
  static errorMessage(BuildContext context, String text) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => AlertDialog(
        content: Text(
          'Error: ' + text,
          style: BeerTextStyles.errorText,
        ),
        backgroundColor: BeerColors.errorBackGround,
        elevation: 24,
      ),
    );
  }
}
