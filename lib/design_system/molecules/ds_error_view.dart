import 'package:flutter/material.dart';
import 'package:vet_app/design_system/atoms/ds_text_button.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

class DsErrorView extends StatelessWidget {
  const DsErrorView({
    required this.message,
    this.onRetry,
    this.retryLabel = 'Reintentar',
    this.padding = const EdgeInsets.symmetric(vertical: DsSpacing.xxl),
    super.key,
  });

  final String message;
  final VoidCallback? onRetry;
  final String retryLabel;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, color: DsColors.ink60, size: 32),
          const SizedBox(height: DsSpacing.sm),
          Text(
            message,
            textAlign: TextAlign.center,
            style: DsTypography.bodyMd.copyWith(color: DsColors.ink60),
          ),
          if (onRetry != null) ...[
            const SizedBox(height: DsSpacing.md),
            DsTextButton(label: retryLabel, onPressed: onRetry),
          ],
        ],
      ),
    );
  }
}
