import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieTheme {
  static AppBarTheme appBar = const AppBarTheme(
    backgroundColor: Color(
      0xff070d2d,
    ),
  );

  static ThemeData theme() {
    return ThemeData(
      primarySwatch: Colors.deepPurple,
      primaryColor: const Color(
        0xff070d2d,
      ),
      appBarTheme: appBar,
    );
  }
}
