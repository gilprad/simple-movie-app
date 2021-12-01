import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_movie_app/helper/constant.dart';

class MovieTheme {
  static AppBarTheme appBar = const AppBarTheme(
    backgroundColor: Color(
      0xff070d2d,
    ),
  );

  static ThemeData theme() {
    return ThemeData(
      primarySwatch: Colors.deepPurple,
      primaryColor: primaryColor,
      appBarTheme: appBar,
    );
  }
}
