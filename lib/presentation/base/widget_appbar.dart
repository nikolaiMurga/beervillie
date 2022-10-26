import 'package:beerville_flutter/app/locator.dart';
import 'package:beerville_flutter/domain/navigation/navigation.dart';
import 'package:beerville_flutter/presentation/res/beer_colors.dart';
import 'package:beerville_flutter/presentation/res/beer_text_styles.dart';
import 'package:beerville_flutter/presentation/tools/global_variables.dart';
import 'package:beerville_flutter/presentation/view/main/main_page.dart';
import 'package:flutter/material.dart';

class WidgetAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String mainText;
  final bool isBackRequired;
  final bool isActionsRequired;
  final Navigation _navigation = locator<Navigation>();

  WidgetAppBar({
    required this.mainText,
    this.isBackRequired = false,
    this.isActionsRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: isBackRequired,
      backgroundColor: BeerColors.black,
      centerTitle: true,
      title: Text(
        mainText,
        style: BeerTextStyles.appBarTitle,
      ),
      toolbarHeight: (77 * GlobalVariables.heightCof).roundToDouble(),
      actions: [
        Visibility(
          visible: isActionsRequired,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () => _navigation.clearPush(
                context,
                MainPage(),
              ),
              child: Icon(
                Icons.close,
                color: BeerColors.white,
                size: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(
        AppBar().preferredSize.width,
        77 * GlobalVariables.heightCof,
      );
}
