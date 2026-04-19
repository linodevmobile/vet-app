import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/appointments/domain/entities/appointment.dart';
import 'package:vet_app/features/home/presentation/sections/appointment_row_tile.dart';

class DashboardAgendaSection extends StatelessWidget {
  const DashboardAgendaSection({
    required this.rows,
    required this.onSeeAll,
    super.key,
  });

  final List<AppointmentRow> rows;
  final VoidCallback onSeeAll;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _Header(
          kicker: 'AGENDA',
          title: 'Hoy',
          meta: '${rows.length} consultas',
          onSeeAll: onSeeAll,
        ),
        const SizedBox(height: DsSpacing.md),
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: List.generate(rows.length, (i) {
              final row = rows[i];
              return AppointmentRowTile(
                time: row.time,
                appointment: row.appointment,
                onTap: row.onTap,
                showDivider: i < rows.length - 1,
              );
            }),
          ),
        ),
      ],
    );
  }
}

class AppointmentRow {
  const AppointmentRow({
    required this.time,
    required this.appointment,
    required this.onTap,
  });

  final String time;
  final Appointment appointment;
  final VoidCallback onTap;
}

class _Header extends StatelessWidget {
  const _Header({
    required this.kicker,
    required this.title,
    required this.meta,
    required this.onSeeAll,
  });

  final String kicker;
  final String title;
  final String meta;
  final VoidCallback onSeeAll;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(kicker, style: DsTypography.kicker),
        const SizedBox(height: 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(title, style: DsTypography.titleLg),
            const SizedBox(width: DsSpacing.sm),
            Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: Text(meta, style: DsTypography.bodySm),
            ),
            const Spacer(),
            GestureDetector(
              onTap: onSeeAll,
              child: Text(
                'Ver todo',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: DsColors.primary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
