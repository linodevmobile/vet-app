import 'package:flutter/material.dart';
import 'package:vet_app/design_system/atoms/ds_chip.dart';
import 'package:vet_app/design_system/atoms/ds_pet_avatar.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/appointments/domain/entities/appointment.dart';

class AppointmentRowTile extends StatelessWidget {
  const AppointmentRowTile({
    required this.time,
    required this.appointment,
    required this.onTap,
    this.showDivider = true,
    super.key,
  });

  final String time;
  final Appointment appointment;
  final VoidCallback onTap;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final isNow = appointment.status == AppointmentStatus.now;

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
          children: [
            SizedBox(
              width: 52,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    time,
                    style: DsTypography.mono.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isNow ? DsColors.primary : DsColors.ink,
                    ),
                  ),
                  if (isNow)
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: Text(
                        'AHORA',
                        style: DsTypography.kicker.copyWith(
                          color: DsColors.primary,
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: DsSpacing.sm),
            DsPetAvatar(
              species: appointment.patient.species,
              size: 34,
              urgent: appointment.urgent,
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
                          appointment.patient.name,
                          style: DsTypography.titleSm,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (appointment.urgent) ...[
                        const SizedBox(width: DsSpacing.xs),
                        const DsChip(
                          label: 'Urg',
                          tone: DsChipTone.urgent,
                          size: DsChipSize.xs,
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 1),
                  Text(
                    appointment.reason,
                    style: DsTypography.bodySm,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, size: 16, color: DsColors.ink40),
          ],
        ),
      ),
    );
  }
}
