import 'package:flutter/material.dart';

class CustomColors {
  Color white = const Color(0xFFFFFFFF);
  Color purple = const Color(0xFF8E70FE);
  Color blue = const Color(0xFF4095F3);
  Color disable = const Color(0xFFDDD4FF);
  Color grey = const Color.fromARGB(255, 190, 190, 190);
  Color black = const Color(0xFF000000);
  Color lightGrey = const Color(0xFFCCCCCC);
  Color lightBlue = const Color(0xFFe1f1fc);
  Color red = const Color(0xFFbe0b19);
  Color orange = const Color(0xFFed8428);

  void actualiceOnThemeChange(bool isDarkMode) {
    grey = isDarkMode
        ? const Color.fromARGB(255, 190, 190, 190)
        : const Color.fromARGB(255, 43, 43, 43);
    black = isDarkMode
        ? const Color(0xFF000000)
        : const Color.fromARGB(255, 51, 51, 51);
    lightGrey = isDarkMode
        ? const Color(0xFFCCCCCC)
        : const Color.fromARGB(255, 180, 180, 180);
  }
}

CustomColors customColors = CustomColors();
