import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

abstract final class AppTheme {
  static ThemeData light() {
    final scheme = ColorScheme.light(
      primary: DsColors.primary,
      onPrimary: Colors.white,
      secondary: DsColors.ai,
      error: DsColors.urgent,
      surface: DsColors.surface,
      onSurface: DsColors.ink,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: DsColors.bg,
      textTheme: GoogleFonts.interTextTheme().apply(
        bodyColor: DsColors.ink,
        displayColor: DsColors.ink,
      ),

      // Cards
      cardTheme: CardThemeData(
        color: DsColors.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DsRadii.r3),
          side: const BorderSide(color: DsColors.line),
        ),
      ),

      // Inputs
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: DsColors.surface,
        hintStyle: DsTypography.bodyMd.copyWith(color: DsColors.ink40),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: DsSpacing.md,
          vertical: DsSpacing.md,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DsRadii.r2),
          borderSide: const BorderSide(color: DsColors.line),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DsRadii.r2),
          borderSide: const BorderSide(color: DsColors.line),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DsRadii.r2),
          borderSide: const BorderSide(color: DsColors.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DsRadii.r2),
          borderSide: const BorderSide(color: DsColors.urgent),
        ),
      ),

      // Botones primarios
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: DsColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          minimumSize: const Size.fromHeight(DsSpacing.buttonLg),
          textStyle: DsTypography.button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DsRadii.r2),
          ),
        ),
      ),

      // FilledButton usa su propio theme (default Material = StadiumBorder / píldora).
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: DsColors.primary,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(DsSpacing.buttonLg),
          textStyle: DsTypography.button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DsRadii.r2),
          ),
        ),
      ),

      // Botones secundarios (bordered)
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: DsColors.ink,
          side: const BorderSide(color: DsColors.line),
          minimumSize: const Size.fromHeight(DsSpacing.buttonMd),
          textStyle: DsTypography.button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DsRadii.r2),
          ),
        ),
      ),

      // Text buttons (ghost)
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: DsColors.primary,
          textStyle: DsTypography.button,
        ),
      ),

      // Divisores
      dividerTheme: const DividerThemeData(
        color: DsColors.lineSoft,
        thickness: 1,
        space: 1,
      ),

      // Bottom nav (tab bar inferior)
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: DsColors.surface,
        selectedItemColor: DsColors.primary,
        unselectedItemColor: DsColors.ink40,
        selectedLabelStyle:
            TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
        unselectedLabelStyle:
            TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),

      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: DsColors.surface,
        foregroundColor: DsColors.ink,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: DsTypography.titleLg,
        iconTheme: const IconThemeData(color: DsColors.ink60),
      ),

      // Snackbar (base para Toast)
      snackBarTheme: SnackBarThemeData(
        backgroundColor: DsColors.ink,
        contentTextStyle: DsTypography.bodyMd.copyWith(color: Colors.white),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DsRadii.r3),
        ),
      ),
    );
  }
}
