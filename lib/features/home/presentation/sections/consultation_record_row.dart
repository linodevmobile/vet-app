import 'package:flutter/material.dart';
import 'package:vet_app/design_system/atoms/ds_chip.dart';
import 'package:vet_app/design_system/atoms/ds_pet_avatar.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/consultations/domain/entities/consultation_record.dart';
import 'package:vet_app/features/consultations/domain/entities/consultation_type.dart';

class ConsultationRecordRow extends StatelessWidget {
  const ConsultationRecordRow({
    required this.record,
    required this.whenLabel,
    required this.onTap,
    this.showDivider = true,
    super.key,
  });

  final ConsultationRecord record;
  final String whenLabel;
  final VoidCallback onTap;
  final bool showDivider;

  DsChipTone get _tone => switch (record.type) {
        ConsultationType.routine => DsChipTone.neutral,
        ConsultationType.surgery => DsChipTone.warn,
        ConsultationType.emergency => DsChipTone.urgent,
      };

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
      decoration: BoxDecoration(
        border: showDivider
            ? const Border(bottom: BorderSide(color: DsColors.lineSoft))
            : null,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: DsSpacing.md,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DsPetAvatar(species: record.patient.species, size: 34),
          const SizedBox(width: DsSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(record.patient.name, style: DsTypography.titleSm),
                const SizedBox(height: 1),
                Text(
                  record.summary,
                  style: DsTypography.bodySm,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: DsSpacing.sm),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                whenLabel.toUpperCase(),
                style: DsTypography.kicker,
              ),
              const SizedBox(height: 4),
              DsChip(
                label: record.type.label,
                tone: _tone,
                size: DsChipSize.xs,
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}
