import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vet_app/design_system/tokens/ds_colors.dart';

abstract final class DsTypography {
  // ─── Helpers ───────────────────────────────────────────────────────────
  static TextStyle _inter({
    double size = 14,
    FontWeight weight = FontWeight.w400,
    Color? color,
    double letter = 0,
    double height = 1.4,
  }) => GoogleFonts.inter(
    fontSize: size,
    fontWeight: weight,
    color: color ?? DsColors.ink,
    letterSpacing: letter,
    height: height,
  );

  static TextStyle _serif({double size = 34, Color? color, double letter = -0.8}) => GoogleFonts.instrumentSerif(
    fontSize: size,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w500,
    color: color ?? DsColors.ink,
    letterSpacing: letter,
    height: 1.05,
  );

  static TextStyle _mono({double size = 14, Color? color, double letter = 1.2}) => GoogleFonts.jetBrainsMono(
    fontSize: size,
    fontWeight: FontWeight.w500,
    color: color ?? DsColors.ink40,
    letterSpacing: letter,
  );

  // ─── Display (splash, login, análisis hero) ────────────────────────────
  static TextStyle get displayLg => _serif(size: 44, letter: -1);
  static TextStyle get displayMd => _serif(size: 34);
  static TextStyle get displaySm => _serif(size: 26, letter: -0.5);

  // ─── Titles (section titles, card headers) ─────────────────────────────
  static TextStyle get titleLg => _inter(size: 20, weight: FontWeight.w600, letter: -0.4);
  static TextStyle get titleMd => _inter(size: 16, weight: FontWeight.w600, letter: -0.2);
  static TextStyle get titleSm => _inter(size: 14, weight: FontWeight.w600);

  // ─── Body ──────────────────────────────────────────────────────────────
  static TextStyle get bodyLg => _inter(size: 15);
  static TextStyle get bodyMd => _inter(size: 14);
  static TextStyle get bodySm => _inter(size: 13, color: DsColors.ink60);

  // ─── Labels ────────────────────────────────────────────────────────────
  static TextStyle get label => _inter(size: 13, weight: FontWeight.w500, color: DsColors.ink80);
  static TextStyle get caption => _inter(size: 13, color: DsColors.ink60);

  // ─── Kicker (all-caps mono tipo "PASO 3 DE 10") ────────────────────────
  static TextStyle get kicker => _mono(size: 12, letter: 1.4);

  // ─── Mono (timestamps, IDs, versiones) ─────────────────────────────────
  static TextStyle get mono => _mono(size: 12, letter: 0.3, color: DsColors.ink60);

  // ─── Button labels ─────────────────────────────────────────────────────
  static TextStyle get button => _inter(size: 14, weight: FontWeight.w500, letter: -0.1);
}
