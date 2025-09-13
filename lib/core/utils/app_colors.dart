import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primary = Colors.orange;
  static const Color itemColor = Color(0xFFFFCC80);
  static const Color black = Color(0xFF000000);
  static Color subBlack = Colors.black.withAlpha(120);
  static const Color white = Colors.white;
  static const Color red = Color(0xFFFF0000);
  static const Color green = Colors.green;

  static List<Color> itemColors = [
    const Color(0xFFFFCC80),
    const Color(0xFF80DEEA),
    const Color(0xFFA5D6A7),
    const Color(0xFFFFAB91),
    const Color(0xFFCF93D9),
    const Color(0xFFF48FB1),
    const Color(0xFF90CAF9),
    const Color(0xFFFFF59D),
  ];
}
