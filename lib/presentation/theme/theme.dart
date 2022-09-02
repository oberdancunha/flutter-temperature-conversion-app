import 'package:flutter/material.dart';

final themeData = ThemeData(
  fontFamily: 'JosefinSans',
  textTheme: const TextTheme().copyWith(
    bodyText2: const TextStyle(
      color: Colors.white,
      fontSize: 85,
    ),
    subtitle1: const TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
  ),
  radioTheme: const RadioThemeData().copyWith(
    fillColor: MaterialStateProperty.all(Colors.white),
  ),
);
