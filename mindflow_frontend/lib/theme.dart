import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//if we want to alllow user-controlled theme: https://www.geeksforgeeks.org/flutter-implement-light-mode-and-dark-mode/

class MyThemes {
  static final darkTheme = ThemeData(
    fontFamily: "LeagueSpartan",
    primarySwatch: Colors.blue,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    hintColor: Colors.white,
    dividerColor: Colors.black12,
    scaffoldBackgroundColor: Color(0xFF131313),
    splashColor: Colors.black.withOpacity(0),
  );

  static final lightTheme = ThemeData(
    fontFamily: "LeagueSpartan",
    primarySwatch: Colors.blue,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    hintColor: Colors.black,
    dividerColor: Colors.white54,
    scaffoldBackgroundColor: Colors.white,
    splashColor: Colors.black.withOpacity(0),
  );
}

//method for lightening a color
Color lighten(Color color, double amount) {
  assert(amount >= 0 && amount <= 1, 'Amount should be between 0 and 1');

  final int red = ((1 - amount) * color.red + amount * 255).round();
  final int green = ((1 - amount) * color.green + amount * 255).round();
  final int blue = ((1 - amount) * color.blue + amount * 255).round();

  return Color.fromARGB(color.alpha, red, green, blue);
}

//method for darkening a color
Color darken(Color color, double amount) {
  assert(amount >= 0 && amount <= 1, 'Amount should be between 0 and 1');

  final int red = ((1 - amount) * color.red).round();
  final int green = ((1 - amount) * color.green).round();
  final int blue = ((1 - amount) * color.blue).round();

  return Color.fromARGB(color.alpha, red, green, blue);
}
