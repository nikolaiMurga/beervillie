import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class Navigation {
  push(BuildContext context, page) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));

  clearPush(BuildContext context, page) => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}
