import 'package:flutter/material.dart';

final ThemeData customTheme = ThemeData(
  primaryColor: Colors.purple[700],
  appBarTheme: AppBarTheme(backgroundColor: Colors.purple[700]),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.purple[700],
      unselectedItemColor: Colors.grey[400],
      selectedItemColor: Colors.white),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.purple[700],
  ),
);
