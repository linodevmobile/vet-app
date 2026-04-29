import 'package:flutter/material.dart';
import 'package:vet_app/design_system/atoms/ds_icon_button.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

class PatientDetailHeaderSection extends StatelessWidget {
  const PatientDetailHeaderSection({
    required this.onBack,
    this.onMore,
    super.key,
  });

  final VoidCallback onBack;
  final VoidCallback? onMore;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DsSpacing.lg,
        vertical: DsSpacing.md,
      ),
      decoration: const BoxDecoration(
        color: DsColors.surface,
        border: Border(bottom: BorderSide(color: DsColors.line)),
      ),
      child: Row(
        children: [
          DsIconButton(icon: Icons.arrow_back, onTap: onBack),
          const SizedBox(width: DsSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'HISTORIA CLÍNICA',
                  style: DsTypography.kicker.copyWith(
                    fontSize: 10,
                    color: DsColors.ink40,
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Ficha del paciente',
                  style: DsTypography.titleSm,
                ),
              ],
            ),
          ),
          DsIconButton(icon: Icons.more_horiz, onTap: onMore ?? () {}),
        ],
      ),
    );
  }
}
