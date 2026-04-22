import 'package:flutter/material.dart';
import 'package:vet_app/design_system/atoms/ds_text_input.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

class ExamBody extends StatelessWidget {
  const ExamBody({
    required this.temperature,
    required this.heartRate,
    required this.respRate,
    required this.weight,
    required this.notes,
    super.key,
  });

  final TextEditingController temperature;
  final TextEditingController heartRate;
  final TextEditingController respRate;
  final TextEditingController weight;
  final TextEditingController notes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: _VitalCard(
                icon: Icons.thermostat,
                label: 'Temp',
                unit: '°C',
                controller: temperature,
              ),
            ),
            const SizedBox(width: DsSpacing.sm),
            Expanded(
              child: _VitalCard(
                icon: Icons.favorite_outline,
                label: 'FC',
                unit: 'ppm',
                controller: heartRate,
              ),
            ),
            const SizedBox(width: DsSpacing.sm),
            Expanded(
              child: _VitalCard(
                icon: Icons.air,
                label: 'FR',
                unit: 'rpm',
                controller: respRate,
              ),
            ),
            const SizedBox(width: DsSpacing.sm),
            Expanded(
              child: _VitalCard(
                icon: Icons.scale,
                label: 'Peso',
                unit: 'kg',
                controller: weight,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        DsTextInput(
          controller: notes,
          hint: 'Observaciones del examen…',
          minLines: 3,
          maxLines: null,
          keyboardType: TextInputType.multiline,
        ),
      ],
    );
  }
}

class _VitalCard extends StatelessWidget {
  const _VitalCard({
    required this.icon,
    required this.label,
    required this.unit,
    required this.controller,
  });

  final IconData icon;
  final String label;
  final String unit;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: DsColors.surfaceAlt,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: DsColors.lineSoft),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(icon, size: 11, color: DsColors.ink40),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  label.toUpperCase(),
                  style: DsTypography.kicker.copyWith(
                    fontSize: 9,
                    letterSpacing: 0.6,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: DsTypography.titleMd.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.4,
                  ),
                ),
              ),
              const SizedBox(width: 2),
              Text(
                unit,
                style: DsTypography.mono.copyWith(
                  fontSize: 9,
                  color: DsColors.ink40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
