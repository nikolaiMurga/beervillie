import 'package:beerville_flutter/presentation/view/navigation/widgets/page_container.dart';
import 'package:beerville_flutter/presentation/view/navigation/widgets/page_navigation_bar.dart';
import 'package:beerville_flutter/presentation/view/random_beer/random_beer_page.dart';
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
            body: PageContainer(),
            bottomNavigationBar: PageNavigationBar(),
          ),
          RandomBeerPage(),
        ],
      ),
    );
  }
}
