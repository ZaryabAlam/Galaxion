import 'package:flutter/material.dart';

Color primaryTextColor = Color(0xFF414C6B);
Color secondaryTextColor = Color(0xFFE4979E);
Color titleTextColor = Colors.white;
Color contentTextColor = Color(0xff868686);
Color navigationColor = Color(0xFF6751B5);
Color gradientStartColor = Color(0xFF0050AC);
Color gradientEndColor = Color(0xFF9354B9);
Color dividerColor = Colors.black38;

TextStyle newStyle(fWeight, fSize, fColor) {
  return TextStyle(
      fontFamily: "Avenir",
      fontSize: fSize,
      color: fColor,
      fontWeight: fWeight);
}
