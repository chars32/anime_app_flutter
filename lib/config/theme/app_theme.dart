import 'package:flutter/material.dart';

const colorSeed = Color(0xE8FFFFFF);
const scaffoldBackgroundColor = Color(0x000166D9);

class AppTheme {
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: scaffoldBackgroundColor,
          titleTextStyle: TextStyle(
            color: colorSeed,
            fontSize: 22,
          ),
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            color: colorSeed,
            fontSize: 22,
          ),
          titleSmall: TextStyle(
            color: colorSeed,
            fontSize: 18,
          ),
        ),
      );
}
