import 'package:flutter/material.dart';

Color darkBackgroundColor = Colors.black;

ThemeData darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: darkBackgroundColor,
  ),
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Colors.white,
    background: darkBackgroundColor,
  ),
  primaryColor: Colors.black,
  useMaterial3: true,
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      iconSize: MaterialStatePropertyAll(20),
    ),
  ),
  iconTheme: const IconThemeData(
    size: 18,
    color: Colors.white,
  ),
);

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepOrange,
  ),
  useMaterial3: true,
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      iconSize: MaterialStatePropertyAll(20),
    ),
  ),
  iconTheme: const IconThemeData(
    size: 18,
  ),
);
