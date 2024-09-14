import 'package:flutter/material.dart';
import 'package:hope/themes/mytext_theme.dart';

class MythemeData {
  static bool isDark = false;
  static var them = ThemeData();
  static ThemeData ligthThem = ThemeData(
      fontFamily: "Poppins",
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: MytextTheme.lightTextThem);

  static ThemeData darkThemData = ThemeData(
      fontFamily: "Poppins",
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: MytextTheme.darkTextTheme);

  static getThemeData() {
    if (them == ThemeData.light()) {
      them = darkThemData;
    } else {
      them = ligthThem;
    }
    return them;
  }
}
