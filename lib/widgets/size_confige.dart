import 'package:flutter/material.dart';

class SizeConfig {
  static double screenWidth;
  static double screenHeight;

  static initSize(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
  }
}

double getRelativeHeight(double percentage) {
  return 10;
}

double getRelativeWidth(double percentage) {
  return 30;
}
