import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Placeholder pixel-art theming direction for Sprout Saga.
/// Colors and typography here are a starting point, not final art.
class AppTheme {
  AppTheme._();

  static const _seedColor = Color(0xFF6FCF97);

  static ThemeData get light {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: _seedColor),
    );
    return base.copyWith(
      textTheme: GoogleFonts.pressStart2pTextTheme(base.textTheme),
    );
  }
}
