import 'package:flutter/material.dart';

Color darkBackgroundColor = Colors.grey[900]!;
Color darkPrimaryColor = Colors.black;

ThemeData darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: darkBackgroundColor,
  ),
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Colors.teal,
    background: darkBackgroundColor,
    secondary: Colors.black,
  ),
  cardTheme: CardTheme(
    color: Colors.grey[800],
  ),
  primaryColor: darkPrimaryColor,
  secondaryHeaderColor: Colors.black,
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
    seedColor: Colors.teal,
  ),
  useMaterial3: true,
  cardTheme: CardTheme(
    color: Colors.grey[100],
  ),
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      iconSize: MaterialStatePropertyAll(20),
    ),
  ),
  iconTheme: const IconThemeData(
    size: 18,
  ),
);
