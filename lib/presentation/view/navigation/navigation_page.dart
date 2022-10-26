import 'package:beerville_flutter/presentation/view/navigation/widgets/navigation_bar_main.dart';
import 'package:beerville_flutter/presentation/view/navigation/widgets/widget_main_page.dart';
import 'package:beerville_flutter/presentation/view/random_beer/random_beer_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Scaffold(
            body: WidgetPageContainer(),
            bottomNavigationBar: NavigationBarMain(),
          ),
          RandomBeerPage(),
        ],
      ),
    );
  }
}
