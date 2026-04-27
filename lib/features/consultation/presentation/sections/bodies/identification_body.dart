import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

class IdentificationBody extends StatelessWidget {
  const IdentificationBody({
    required this.name,
    required this.subtitle,
    super.key,
  });

  final String name;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: DsColors.okSoft,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: DsColors.ok.withValues(alpha: 0.25)),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline, size: 16, color: DsColors.ok),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: DsTypography.titleSm.copyWith(fontSize: 13),
                ),
                if (subtitle.isNotEmpty)
                  Text(
                    subtitle,
                    style: DsTypography.bodySm.copyWith(
                      fontSize: 11,
                      color: DsColors.ink60,
                    ),
                  ),
                const SizedBox(height: 2),
                Text(
                  'Prellenado desde ficha · sincronizado',
                  style: DsTypography.kicker.copyWith(
                    fontSize: 9,
                    color: DsColors.ok,
                    letterSpacing: 0.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
