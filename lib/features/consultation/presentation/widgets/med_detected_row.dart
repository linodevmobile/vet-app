import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/ds_colors.dart';

class MedDetectedRow extends StatelessWidget {
  const MedDetectedRow({
    required this.drug,
    required this.dose,
    required this.frequency,
    required this.duration,
    super.key,
  });

  final String drug;
  final String dose;
  final String frequency;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: DsColors.aiSoft,
        border: Border.all(color: DsColors.primary.withValues(alpha: 0.2)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.auto_awesome, size: 14, color: DsColors.ai),
          const SizedBox(width: 8),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: drug,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: DsColors.ink,
                    ),
                  ),
                  TextSpan(
                    text: '  ·  $dose  ·  $frequency  ·  $duration',
                    style: const TextStyle(
                      fontSize: 12,
                      color: DsColors.ink60,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
