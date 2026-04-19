import 'package:flutter/material.dart';
import 'package:vet_app/design_system/atoms/ds_avatar_initials.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

class DashboardHeaderSection extends StatelessWidget {
  const DashboardHeaderSection({
    required this.dateLabel,
    required this.greeting,
    required this.initials,
    super.key,
  });

  final String dateLabel;
  final String greeting;
  final String initials;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(dateLabel, style: DsTypography.kicker),
              const SizedBox(height: 2),
              Text(
                greeting,
                style: DsTypography.titleLg.copyWith(
                  fontSize: 24,
                  letterSpacing: -0.6,
                ),
              ),
            ],
          ),
        ),
        DsAvatarInitials(initials: initials),
      ],
    );
  }
}
