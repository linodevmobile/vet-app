import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/hospitalization/domain/entities/hospitalized_patient.dart';
import 'package:vet_app/features/home/presentation/sections/dashboard_section_header.dart';
import 'package:vet_app/features/home/presentation/sections/hospitalized_patient_card.dart';

class DashboardHospitalizationSection extends StatelessWidget {
  const DashboardHospitalizationSection({
    required this.patients,
    required this.onPatientTap,
    super.key,
  });

  final List<HospitalizedPatient> patients;
  final ValueChanged<HospitalizedPatient> onPatientTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DashboardSectionHeader(
          kicker: 'INTERNACIÓN',
          title: 'Pacientes en observación',
          meta: '${patients.length} activos',
        ),
        const SizedBox(height: DsSpacing.md),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: DsSpacing.sm,
          mainAxisSpacing: DsSpacing.sm,
          childAspectRatio: 1.15,
          children: patients
              .map(
                (p) => HospitalizedPatientCard(
                  data: p,
                  onTap: () => onPatientTap(p),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
