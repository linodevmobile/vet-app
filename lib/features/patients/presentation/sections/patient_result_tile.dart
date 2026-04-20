import 'package:flutter/material.dart';
import 'package:vet_app/design_system/atoms/ds_chip.dart';
import 'package:vet_app/design_system/atoms/ds_pet_avatar.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/patients/domain/entities/patient.dart';

class PatientResultTile extends StatelessWidget {
  const PatientResultTile({
    required this.patient,
    required this.lastVisitLabel,
    required this.onTap,
    super.key,
  });

  final Patient patient;
  final String lastVisitLabel;
  final VoidCallback onTap;

  String get _subtitle =>
      '${patient.breed} · ${patient.ageYears} años · ${patient.ownerName}';

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(DsSpacing.md),
          child: Row(
            children: [
              DsPetAvatar(
                species: patient.species,
                urgent: patient.isAlert,
              ),
              const SizedBox(width: DsSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            patient.name,
                            style: DsTypography.titleSm,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (patient.isAlert) ...[
                          const SizedBox(width: 6),
                          const DsChip(
                            label: 'Alerta',
                            tone: DsChipTone.urgent,
                            size: DsChipSize.xs,
                          ),
                        ],
                        if (patient.isHospitalized) ...[
                          const SizedBox(width: 6),
                          const DsChip(
                            label: 'Internado',
                            tone: DsChipTone.warn,
                            size: DsChipSize.xs,
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      _subtitle,
                      style: DsTypography.bodySm,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Última visita: $lastVisitLabel',
                      style: DsTypography.caption.copyWith(
                        fontSize: 11,
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
      ),
    );
  }
}
