import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/patients/domain/entities/species.dart';

class SpeciesOptionTile extends StatelessWidget {
  const SpeciesOptionTile({
    required this.species,
    required this.label,
    required this.selected,
    required this.onTap,
    super.key,
  });

  final Species species;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bg = selected ? DsColors.ink : DsColors.surface;
    final fg = selected ? Colors.white : DsColors.ink;
    final border = selected ? DsColors.ink : DsColors.line;

    return InkWell(
      borderRadius: BorderRadius.circular(DsRadii.r2),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: DsSpacing.sm,
          vertical: DsSpacing.md,
        ),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(DsRadii.r2),
          border: Border.all(color: border),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: DsColors.surface,
                borderRadius: BorderRadius.circular(DsRadii.r1),
                border: Border.all(color: DsColors.lineSoft),
              ),
              child: SvgPicture.asset(species.asset, width: 24, height: 24),
            ),
            const SizedBox(height: DsSpacing.sm),
            Text(
              label,
              style: DsTypography.titleSm.copyWith(color: fg),
            ),
          ],
        ),
      ),
    );
  }
}
