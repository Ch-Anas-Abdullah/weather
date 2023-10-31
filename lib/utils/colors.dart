import 'package:flutter/material.dart';

class AppColor {
  static Color gradientClr1 = const Color(0xff08114F);

  static Color gradientClr2 = const Color(0xff134CB5);
  static Color gradientClr3 = const Color(0xff0B42AB);
  static Color textClr = Colors.white;
  static Color containerBackground = Colors.black.withAlpha(25);

  static LinearGradient linearGradient = LinearGradient(
    colors: [
      AppColor.gradientClr1,
      AppColor.gradientClr2,
      AppColor.gradientClr3
    ],
    stops: const [0.1, 0.5, 0.8],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
