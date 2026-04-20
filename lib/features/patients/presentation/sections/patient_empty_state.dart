import 'package:flutter/material.dart';
import 'package:vet_app/design_system/atoms/ds_primary_button.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

class PatientEmptyState extends StatelessWidget {
  const PatientEmptyState({
    required this.query,
    required this.onCreate,
    super.key,
  });

  final String query;
  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(DsSpacing.xl),
        child: Column(
          children: [
            Text(
              'Sin coincidencias para "$query"',
              style: DsTypography.bodyMd.copyWith(color: DsColors.ink60),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              '¿Es un paciente nuevo?',
              style: DsTypography.caption.copyWith(
                fontSize: 12,
                color: DsColors.ink40,
              ),
            ),
            const SizedBox(height: DsSpacing.md),
            DsPrimaryButton(
              label: 'Crear paciente "$query"',
              icon: const Icon(Icons.add, size: 16),
              onPressed: onCreate,
            ),
          ],
        ),
      ),
    );
  }
}
