import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/home/presentation/sections/dashboard_section_header.dart';
import 'package:vet_app/features/home/presentation/sections/paused_consultation_row.dart';
import 'package:vet_app/features/patients/domain/entities/species.dart';

class DashboardInProgressSection extends StatelessWidget {
  const DashboardInProgressSection({required this.rows, super.key});

  final List<PausedRow> rows;

  @override
  Widget build(BuildContext context) {
    if (rows.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DashboardSectionHeader(
          kicker: 'EN PROGRESO',
          title: 'Consultas abiertas',
          meta: '${rows.length} esperando',
        ),
        const SizedBox(height: DsSpacing.md),
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: List.generate(rows.length, (i) {
              final row = rows[i];
              return PausedConsultationRow(
                species: row.species,
                patientName: row.patientName,
                waitingLabel: row.waitingLabel,
                status: row.status,
                sectionsCompleted: row.sectionsCompleted,
                sectionsTotal: row.sectionsTotal,
                isStale: row.isStale,
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

class PausedRow {
  const PausedRow({
    required this.species,
    required this.patientName,
    required this.waitingLabel,
    required this.status,
    required this.sectionsCompleted,
    required this.sectionsTotal,
    required this.isStale,
    required this.onTap,
  });

  final Species species;
  final String patientName;
  final String waitingLabel;
  final String status;
  final int sectionsCompleted;
  final int sectionsTotal;
  final bool isStale;
  final VoidCallback onTap;
}
