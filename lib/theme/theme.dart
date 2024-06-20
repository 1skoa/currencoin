import 'package:flutter/material.dart';

// Светлая тема
final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  colorScheme: const ColorScheme.light(),
  dividerColor: Colors.black26,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
  ),
  listTileTheme: const ListTileThemeData(
    iconColor: Colors.black,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: 20,
    ),
    labelSmall: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w700,
      fontSize: 14,
    ),
    headlineMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: 25,
    ),
  )
);

// Тёмная тема
final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black54,
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: Colors.amber,
  ),
  dividerColor: Colors.white24,
  appBarTheme: const AppBarTheme(
    // elevation: 4,
    // shadowColor: Colors.white10,
    backgroundColor: Colors.black54,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
  ),
  listTileTheme: const ListTileThemeData(
    iconColor: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    labelSmall: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w700,
      fontSize: 14,
    ),
    headlineMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 25,
    ),
  ),
);
