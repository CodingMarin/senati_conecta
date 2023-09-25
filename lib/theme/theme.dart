
import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: const Color(0xFF0F1418),
    scaffoldBackgroundColor: Colors.white,
    dividerColor: const Color(0xFF536471),
    colorScheme: const ColorScheme.light(
      background: Colors.white,
      primary: Color(0xFF1D9BF0),
    ),
  drawerTheme: DrawerThemeData(
    backgroundColor: Colors.white
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
  ),
);

ThemeData darkMode = ThemeData(
  useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    dividerColor: const Color(0xFF2F3336),
    scaffoldBackgroundColor: Colors.black,
    drawerTheme: DrawerThemeData(
        backgroundColor: Colors.black
    ),
    colorScheme: const ColorScheme.dark(
      background: Colors.black,
    )
);