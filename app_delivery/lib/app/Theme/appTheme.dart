import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        fontFamily: 'Oswald',
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFFD90B0B),
          onPrimary: Colors.white,
          secondary: Color(0xFFA60505),
          onSecondary: Colors.white,
          tertiary: Color(0xFFF29B88),
          onTertiary: Colors.black,
          surface: Color(0xFFF2AE2E),
          onSurface: Color(0xFFD90B0B),
          error: Colors.red,
          onError: Colors.white,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontFamily: 'Oswald', fontWeight: FontWeight.w700, fontSize: 34),
          displayMedium: TextStyle(
              fontFamily: 'Oswald', fontWeight: FontWeight.w600, fontSize: 28),
          displaySmall: TextStyle(
              fontFamily: 'Oswald', fontWeight: FontWeight.w500, fontSize: 22),
          headlineLarge: TextStyle(
              fontFamily: 'Oswald', fontWeight: FontWeight.w700, fontSize: 32),
          headlineMedium: TextStyle(
              fontFamily: 'Oswald', fontWeight: FontWeight.w600, fontSize: 26),
          headlineSmall: TextStyle(
              fontFamily: 'Oswald', fontWeight: FontWeight.w500, fontSize: 20),
          titleLarge: TextStyle(
              fontFamily: 'Oswald', fontWeight: FontWeight.w700, fontSize: 24),
          titleMedium: TextStyle(
              fontFamily: 'Oswald', fontWeight: FontWeight.w600, fontSize: 20),
          titleSmall: TextStyle(
              fontFamily: 'Oswald', fontWeight: FontWeight.w500, fontSize: 18),
          bodyLarge: TextStyle(
              fontFamily: 'Oswald', fontWeight: FontWeight.w400, fontSize: 16),
          bodyMedium: TextStyle(
              fontFamily: 'Oswald', fontWeight: FontWeight.w400, fontSize: 14),
          bodySmall: TextStyle(
              fontFamily: 'Oswald', fontWeight: FontWeight.w400, fontSize: 12),
          labelLarge: TextStyle(
              fontFamily: 'Oswald', fontWeight: FontWeight.w700, fontSize: 16),
          labelMedium: TextStyle(
              fontFamily: 'Oswald', fontWeight: FontWeight.w600, fontSize: 14),
          labelSmall: TextStyle(
              fontFamily: 'Oswald', fontWeight: FontWeight.w500, fontSize: 12),
        ),
        useMaterial3: false,
      );
}
