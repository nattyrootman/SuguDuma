import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hope/themes/mytheme.dart';

class MyColor {
  static const line1 = LinearGradient(colors: [
    Color.fromARGB(255, 238, 81, 230),
    Color.fromRGBO(204, 58, 197, 11),
    Color.fromARGB(255, 142, 26, 172)
  ]);

  static const line2 = LinearGradient(colors: [
    Color.fromARGB(255, 37, 185, 223),
    Color.fromARGB(255, 150, 214, 243),
    Color.fromARGB(255, 119, 243, 237)
  ]);

  static const line3 = LinearGradient(colors: [
    Color.fromARGB(255, 197, 130, 241),
    Color.fromARGB(255, 193, 70, 209),
    Color.fromARGB(255, 167, 219, 240)
  ]);

  static Color? getColor(String colorName) {
    // colorName = colorName.toLowerCase();

    // Check the input string and return the corresponding Color
    if (colorName == "Red") {
      return Colors.red; // Red
    } else if (colorName == "Blue") {
      return Colors.blue;
    } else if (colorName == "Green") {
      return Colors.green;
    } else if (colorName == "yellow") {
      return Colors.yellow;
    } else if (colorName == "Black") {
      return Colors.black;
    } else if (colorName == "White") {
      return Colors.white;
    } else if (colorName == "Purple") {
      return Colors.purple;
    } else if (colorName == "Brown") {
      return Colors.brown;
    } else if (colorName == "Grey") {
      return Colors.grey;
    } else if (colorName == "Pink") {
      return Colors.pink;
    } else {
      return Colors.deepPurpleAccent;
    }
  }

  static bool isDarkMode(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark;
  }
}

/*static Color getColor(String value){



  }*
}*/
