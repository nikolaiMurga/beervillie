import 'package:beerville_flutter/app/locator.dart';
import 'package:beerville_flutter/domain/navigation/navigation.dart';
import 'package:beerville_flutter/presentation/res/beer_strings.dart';
import 'package:beerville_flutter/presentation/res/beer_text_styles.dart';
import 'package:beerville_flutter/presentation/view/navigation/navigation_page.dart';
import 'package:beerville_flutter/presentation/view/splash/bloc/slpash_page_state.dart';
import 'package:beerville_flutter/presentation/view/splash/bloc/splash_page_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetSplash extends StatelessWidget {
  final Navigation _navigation = locator<Navigation>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashPageBloc, SplashPageState>(
      builder: (context, state) {
        if (state is InitSplashPageState) {
          Future.delayed(Duration(seconds: 2), () => _navigation.clearPush(context, NavigationPage()));
          return Center(child: Text(BeerStrings.beerVille.toUpperCase(), style: BeerTextStyles.splashTitle));
        }
        return Text('NO DATA');
      },
    );
  }
}
