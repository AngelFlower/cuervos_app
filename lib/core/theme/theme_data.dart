import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.green,
        primaryColor: Colors.green.shade600,
        hintColor: Colors.grey.shade400,
        secondaryHeaderColor: Colors.green.shade500,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        fontFamily: 'Roboto',
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.green.shade500,
          textTheme: ButtonTextTheme.primary,
        ),
        appBarTheme: const AppBarTheme(foregroundColor: Color.fromARGB(255, 241, 241, 241)),
      );
}
