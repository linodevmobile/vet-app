import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

class DsPrimaryButton extends StatelessWidget {
  const DsPrimaryButton({required this.label, required this.onPressed, this.isLoading = false, this.icon, super.key});

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[icon!, const SizedBox(width: DsSpacing.sm)],
                Text(label),
              ],
            ),
    );
  }
}
