import 'package:flutter/material.dart';
import 'package:vet_app/design_system/atoms/ds_chip.dart';
import 'package:vet_app/design_system/atoms/ds_pet_avatar.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/patients/domain/entities/species.dart';

class PausedConsultationRow extends StatelessWidget {
  const PausedConsultationRow({
    required this.species,
    required this.patientName,
    required this.waitingLabel,
    required this.status,
    required this.sectionsCompleted,
    required this.sectionsTotal,
    required this.isStale,
    required this.onTap,
    this.showDivider = true,
    super.key,
  });

  final Species species;
  final String patientName;
  final String waitingLabel;
  final String status;
  final int sectionsCompleted;
  final int sectionsTotal;
  final bool isStale;
  final bool showDivider;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final waitingColor = isStale ? DsColors.urgent : DsColors.warn;
    final bgColor = isStale
        ? DsColors.urgent.withValues(alpha: 0.024)
        : Colors.transparent;
    final progress = sectionsTotal == 0
        ? 0.0
        : (sectionsCompleted / sectionsTotal).clamp(0.0, 1.0);

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: bgColor,
          border: showDivider
              ? const Border(bottom: BorderSide(color: DsColors.lineSoft))
              : null,
        ),
        child: Row(
          children: [
            DsPetAvatar(species: species, size: 34),
            const SizedBox(width: DsSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          patientName,
                          style: DsTypography.titleSm,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (isStale) ...[
                        const SizedBox(width: 6),
                        const DsChip(
                          label: '+2h',
                          tone: DsChipTone.urgent,
                          size: DsChipSize.xs,
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        waitingLabel,
                        style: DsTypography.mono.copyWith(
                          fontSize: 11,
                          color: waitingColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          '· $status',
                          style: DsTypography.bodySm.copyWith(
                            fontSize: 11,
                            color: DsColors.ink60,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: Container(
                      height: 3,
                      color: DsColors.lineSoft,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: FractionallySizedBox(
                          widthFactor: progress,
                          child: Container(color: DsColors.primary),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '$sectionsCompleted/$sectionsTotal secciones',
                    style: DsTypography.mono.copyWith(
                      fontSize: 10,
                      color: DsColors.ink40,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: DsSpacing.sm),
            const Icon(
              Icons.chevron_right,
              size: 14,
              color: DsColors.ink40,
            ),
          ],
        ),
      ),
    );
  }
}
