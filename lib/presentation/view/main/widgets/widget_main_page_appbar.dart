import 'package:beerville_flutter/presentation/res/beer_colors.dart';
import 'package:beerville_flutter/presentation/res/beer_strings.dart';
import 'package:beerville_flutter/presentation/res/beer_text_styles.dart';
import 'package:beerville_flutter/presentation/tools/global_variables.dart';
import 'package:flutter/material.dart';

class AppBarMain extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: BeerColors.black,
      centerTitle: true,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            BeerStrings.beerVille.toUpperCase(),
            style: BeerTextStyles.appBarMainTitle,
          ),
          Text(
            BeerStrings.findYourOwn,
            style: BeerTextStyles.subAppBarText,
          ),
        ],
      ),
      toolbarHeight: (106.0 * GlobalVariables.heightCof).roundToDouble(),
    );
  }

  @override
  Size get preferredSize => Size(
        AppBar().preferredSize.width,
        106.0 * GlobalVariables.heightCof,
      );
}
