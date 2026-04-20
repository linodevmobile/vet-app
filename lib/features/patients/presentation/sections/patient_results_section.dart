import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/patients/presentation/sections/patient_result_tile.dart';

class PatientResultsSection extends StatelessWidget {
  const PatientResultsSection({
    required this.tiles,
    super.key,
  });

  final List<PatientResultTile> tiles;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '${tiles.length} pacientes',
          style: DsTypography.kicker,
        ),
        const SizedBox(height: DsSpacing.sm),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: tiles.length,
          separatorBuilder: (_, __) => const SizedBox(height: DsSpacing.sm),
          itemBuilder: (_, i) => tiles[i],
        ),
      ],
    );
  }
}
