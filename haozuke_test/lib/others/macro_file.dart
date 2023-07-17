import 'package:flutter/material.dart';

extension ExColor on Color {

  static Color hexStr(String hex,{double alphaVal = 1.0}) {
    return Color(int.parse(hex,radix: 16)).withAlpha((255 * alphaVal).toInt());
  }

  static void aaaaa() {

  }

}