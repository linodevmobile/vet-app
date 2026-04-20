import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

class DashboardSectionHeader extends StatelessWidget {
  const DashboardSectionHeader({
    required this.kicker,
    required this.title,
    this.meta,
    this.onSeeAll,
    super.key,
  });

  final String kicker;
  final String title;
  final String? meta;
  final VoidCallback? onSeeAll;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(kicker, style: DsTypography.kicker),
        const SizedBox(height: 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(title, style: DsTypography.titleLg),
            if (meta != null) ...[
              const SizedBox(width: DsSpacing.sm),
              Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: Text(meta!, style: DsTypography.bodySm),
              ),
            ],
            const Spacer(),
            if (onSeeAll != null)
              GestureDetector(
                onTap: onSeeAll,
                child: const Text(
                  'Ver todo',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: DsColors.primary,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
