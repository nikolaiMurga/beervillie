import 'package:beerville_flutter/app/locator.dart';
import 'package:beerville_flutter/presentation/view/main/bloc/main_page_bloc.dart';
import 'package:beerville_flutter/presentation/view/main/bloc/main_page_event.dart';
import 'package:beerville_flutter/presentation/view/navigation/bloc/navigation_page_bloc.dart';
import 'package:beerville_flutter/presentation/view/random_beer/bloc/random_beer_page_bloc.dart';
import 'package:beerville_flutter/presentation/view/splash/bloc/splash_page_bloc.dart';
import 'package:beerville_flutter/presentation/view/splash/bloc/splash_page_event.dart';
import 'package:beerville_flutter/presentation/view/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashPageBloc>(create: (context) => SplashPageBloc()..add(LoadSplashPageEvent())),
        BlocProvider<NavigationPageBloc>(create: (context) => NavigationPageBloc()),
        BlocProvider<MainPageBloc>(create: (context) => MainPageBloc()..add(LoadBeersEvent())),
        BlocProvider<RandomBeerPageBloc>(create: (context) => RandomBeerPageBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
