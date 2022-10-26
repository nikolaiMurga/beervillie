import 'dart:async';

import 'package:beerville_flutter/presentation/view/splash/bloc/slpash_page_state.dart';
import 'package:beerville_flutter/presentation/view/splash/bloc/splash_page_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPageBloc extends Bloc<SplashPageEvent, SplashPageState> {
  SplashPageBloc() : super(InitSplashPageState());

  @override
  Stream<SplashPageState> mapEventToState(SplashPageEvent event) async* {}
}
