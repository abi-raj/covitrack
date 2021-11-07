import 'package:flutter/material.dart';

const Color authColor = Color.fromRGBO(24, 68, 108, 0.8);

const TextStyle authStyle = TextStyle(
  color: authColor,
  fontWeight: FontWeight.bold,
  fontSize: 17,
  decoration: TextDecoration.underline,
);

const Color emergencyColor = Color.fromRGBO(245, 45, 0, 0.8);
Color getColorFromHex(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  if (hexColor.length == 8) {
    return Color(int.parse("0x$hexColor"));
  }
  return Color(int.parse("0x$hexColor"));
}

final primaryLight = getColorFromHex("#1b7dc8");
final primaryDark = getColorFromHex("#202b6d");
final suppl1 = getColorFromHex("#25476c");
final suppl2 = getColorFromHex("#9494b4");