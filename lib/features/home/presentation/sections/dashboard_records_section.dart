import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/consultations/domain/entities/consultation_record.dart';
import 'package:vet_app/features/home/presentation/sections/consultation_record_row.dart';
import 'package:vet_app/features/home/presentation/sections/dashboard_section_header.dart';

class DashboardRecordsSection extends StatelessWidget {
  const DashboardRecordsSection({
    required this.rows,
    super.key,
  });

  final List<RecordRow> rows;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const DashboardSectionHeader(
          kicker: 'REGISTROS',
          title: 'Recientes',
        ),
        const SizedBox(height: DsSpacing.md),
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: List.generate(rows.length, (i) {
              final row = rows[i];
              return ConsultationRecordRow(
                record: row.record,
                whenLabel: row.whenLabel,
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

class RecordRow {
  const RecordRow({
    required this.record,
    required this.whenLabel,
    required this.onTap,
  });

  final ConsultationRecord record;
  final String whenLabel;
  final VoidCallback onTap;
}
