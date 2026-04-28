import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

class DsTextButton extends StatelessWidget {
  const DsTextButton({
    required this.label,
    required this.onPressed,
    this.icon,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: DsColors.ink,
        textStyle: DsTypography.titleSm,
        padding: const EdgeInsets.symmetric(
          horizontal: DsSpacing.md,
          vertical: DsSpacing.sm,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[icon!, const SizedBox(width: DsSpacing.sm)],
          Text(label),
        ],
      ),
    );
  }
}
