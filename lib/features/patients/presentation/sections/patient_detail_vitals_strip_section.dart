import 'package:flutter/material.dart';
import 'package:vet_app/app/shared/utils/patient_formatters.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

class PatientDetailVitalsStripSection extends StatelessWidget {
  const PatientDetailVitalsStripSection({required this.vitals, super.key});

  final List<PatientDetailVital> vitals;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: DsSpacing.md),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: DsColors.lineSoft)),
      ),
      child: Row(
        children: vitals
            .map((v) => Expanded(child: _VitalCell(vital: v)))
            .toList(),
      ),
    );
  }
}

class _VitalCell extends StatelessWidget {
  const _VitalCell({required this.vital});

  final PatientDetailVital vital;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          vital.label.toUpperCase(),
          style: DsTypography.kicker.copyWith(
            fontSize: 9,
            color: DsColors.ink40,
            letterSpacing: 0.6,
          ),
        ),
        const SizedBox(height: 2),
        RichText(
          text: TextSpan(
            style: DsTypography.titleMd.copyWith(fontSize: 18, height: 1.1),
            children: [
              TextSpan(text: vital.value),
              if (vital.unit.isNotEmpty)
                TextSpan(
                  text: ' ${vital.unit}',
                  style: DsTypography.bodySm.copyWith(
                    fontSize: 11,
                    color: DsColors.ink40,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
