import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

enum DsChipTone { urgent, warn, ok, neutral, primary }

enum DsChipSize { xs, sm }

class DsChip extends StatelessWidget {
  const DsChip({
    required this.label,
    this.tone = DsChipTone.neutral,
    this.size = DsChipSize.sm,
    super.key,
  });

  final String label;
  final DsChipTone tone;
  final DsChipSize size;

  ({Color bg, Color fg}) _colors() => switch (tone) {
        DsChipTone.urgent => (bg: DsColors.urgentSoft, fg: DsColors.urgent),
        DsChipTone.warn => (bg: DsColors.warnSoft, fg: DsColors.warn),
        DsChipTone.ok => (bg: DsColors.okSoft, fg: DsColors.ok),
        DsChipTone.neutral => (bg: DsColors.surfaceAlt, fg: DsColors.ink60),
        DsChipTone.primary => (bg: DsColors.primarySoft, fg: DsColors.primaryInk),
      };

  ({double padH, double padV, double font}) _dims() => switch (size) {
        DsChipSize.xs => (padH: 6, padV: 2, font: 10),
        DsChipSize.sm => (padH: 8, padV: 4, font: 11),
      };

  @override
  Widget build(BuildContext context) {
    final c = _colors();
    final d = _dims();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: d.padH, vertical: d.padV),
      decoration: BoxDecoration(
        color: c.bg,
        borderRadius: BorderRadius.circular(DsRadii.r1),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: d.font,
          fontWeight: FontWeight.w600,
          color: c.fg,
        ),
      ),
    );
  }
}
