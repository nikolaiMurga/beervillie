import 'package:flutter/rendering.dart';

class GlobalVariables {
  static Size size = Size(0, 0);
  static double _defaultHeight = 812.0;
  static double _defaultWight = 375.0;
  static double heightCof = size.height / _defaultHeight;
  static double wightCof = size.width / _defaultWight;
}
