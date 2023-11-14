import 'package:flutter/material.dart';

class LighTheme {
  final lightColor = _LightColor();

  late ThemeData theme;

  LighTheme() {
    theme = ThemeData(
      appBarTheme: const AppBarTheme(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)))),
      scaffoldBackgroundColor: Colors.white.withOpacity(0.8),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.green),
      textTheme: ThemeData.light().textTheme.copyWith(
            titleMedium: TextStyle(
              fontSize: 25.0,
              color: lightColor._textColor,
            ),
          ),
      buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.light(
        onPrimary: Colors.purple,
        onSecondary: _LightColor()._royalBlue,
      )),
      colorScheme: const ColorScheme.light(),
      checkboxTheme: const CheckboxThemeData(
          side: BorderSide(color: Colors.red), fillColor: MaterialStatePropertyAll(Colors.green)),
    );
  }
}

class _LightColor {
  final Color _textColor = const Color.fromARGB(255, 50, 48, 48);
  final Color _royalBlue = const Color.fromARGB(68, 108, 228, 1);
}
