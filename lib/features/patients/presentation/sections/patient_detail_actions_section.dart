import 'package:flutter/material.dart';
import 'package:vet_app/design_system/atoms/ds_primary_button.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

class PatientDetailActionsSection extends StatelessWidget {
  const PatientDetailActionsSection({
    required this.onNewConsultation,
    required this.onHospitalize,
    super.key,
  });

  final VoidCallback onNewConsultation;
  final VoidCallback onHospitalize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: DsPrimaryButton(
            label: 'Nueva consulta',
            icon: const Icon(Icons.add, size: 16),
            onPressed: onNewConsultation,
          ),
        ),
        const SizedBox(width: DsSpacing.sm),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: onHospitalize,
            icon: const Icon(Icons.bed_outlined, size: 16),
            label: const Text('Hospitalizar'),
          ),
        ),
      ],
    );
  }
}
