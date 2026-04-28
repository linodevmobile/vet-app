import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/appointments/domain/entities/appointment.dart';
import 'package:vet_app/features/home/presentation/sections/appointment_row_tile.dart';
import 'package:vet_app/features/home/presentation/sections/dashboard_section_header.dart';

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
        DashboardSectionHeader(
          kicker: 'AGENDA',
          title: 'Hoy',
          meta: '${rows.length} consultas',
          onSeeAll: onSeeAll,
        ),
        if (rows.isNotEmpty) ...[
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
