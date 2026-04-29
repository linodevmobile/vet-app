import 'package:flutter/material.dart';
import 'package:vet_app/design_system/atoms/ds_chip.dart';
import 'package:vet_app/design_system/atoms/ds_pet_avatar.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/patients/domain/entities/species.dart';

typedef PatientDetailChip = ({String label, DsChipTone tone});

class PatientDetailHeroSection extends StatelessWidget {
  const PatientDetailHeroSection({
    required this.species,
    required this.name,
    required this.identityLine,
    required this.ownerLine,
    this.urgent = false,
    this.chips = const [],
    super.key,
  });

  final Species species;
  final String name;
  final String identityLine;
  final String ownerLine;
  final bool urgent;
  final List<PatientDetailChip> chips;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DsPetAvatar(
          species: species,
          size: 68,
          urgent: urgent,
        ),
        const SizedBox(width: DsSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                spacing: DsSpacing.sm,
                children: [
                  Text(
                    name,
                    style: DsTypography.titleLg.copyWith(fontSize: 24),
                  ),
                  Text(identityLine, style: DsTypography.bodySm),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                ownerLine,
                style: DsTypography.bodySm.copyWith(fontSize: 12),
              ),
              if (chips.isNotEmpty) ...[
                const SizedBox(height: 10),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: chips
                      .map(
                        (c) => DsChip(
                          label: c.label,
                          tone: c.tone,
                          size: DsChipSize.xs,
                        ),
                      )
                      .toList(),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
