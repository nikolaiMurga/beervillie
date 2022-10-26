import 'package:beerville_flutter/presentation/res/beer_colors.dart';
import 'package:beerville_flutter/presentation/res/beer_strings.dart';
import 'package:beerville_flutter/presentation/res/beer_text_styles.dart';
import 'package:beerville_flutter/presentation/tools/build_context_extensions.dart';
import 'package:beerville_flutter/presentation/tools/global_variables.dart';
import 'package:beerville_flutter/presentation/view/navigation/bloc/navigation_page_bloc.dart';
import 'package:beerville_flutter/presentation/view/navigation/bloc/navigation_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBarMain extends StatelessWidget {
  const NavigationBarMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavigationPageBloc _bloc = context.bloc<NavigationPageBloc>();
    return BlocBuilder<NavigationPageBloc, NavigationPageState>(
      builder: (context, state) => Container(
        height: (83 * GlobalVariables.heightCof).roundToDouble(),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label: BeerStrings.beerList,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label: BeerStrings.search,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label: BeerStrings.favourite,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label: BeerStrings.settings,
            ),
          ],
          currentIndex: _bloc.state.toIndex(),
          selectedItemColor: BeerColors.black,
          unselectedItemColor: BeerColors.unselected,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          iconSize: 28,
          selectedLabelStyle: BeerTextStyles.bottomLabel,
          unselectedLabelStyle: BeerTextStyles.bottomLabel,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => _bloc.add(index.toEvent()),
        ),
      ),
    );
  }
}
