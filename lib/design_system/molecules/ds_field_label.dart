import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

class DsFieldLabel extends StatelessWidget {
  const DsFieldLabel({
    required this.label,
    required this.child,
    super.key,
  });

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(), style: DsTypography.kicker),
        const SizedBox(height: DsSpacing.sm),
        child,
      ],
    );
  }
}
