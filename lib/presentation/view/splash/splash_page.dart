import 'package:beerville_flutter/presentation/tools/global_variables.dart';
import 'package:beerville_flutter/presentation/view/splash/widgets/widget_splash.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalVariables.size = MediaQuery.of(context).size;
    return Scaffold(body: WidgetSplash());
  }
}
