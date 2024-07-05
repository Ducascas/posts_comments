import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: Colors.indigo),
      textTheme: const TextTheme(
        titleSmall: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      useMaterial3: true,
    );
  }
}
