import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

enum DsToastVariant { success, error }

abstract final class DsToast {
  static const _duration = Duration(seconds: 3);
  static const _badgeSize = 32.0;

  static void show(
    BuildContext context, {
    required String message,
    required DsToastVariant variant,
  }) {
    final media = MediaQuery.of(context);
    // Hack para anclar al top: margen inferior grande empuja el SnackBar hacia arriba.
    final bottomMargin = media.size.height - media.padding.top - 80;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: DsColors.ink,
          duration: _duration,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
            left: DsSpacing.lg,
            right: DsSpacing.lg,
            bottom: bottomMargin,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DsRadii.r4),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: DsSpacing.sm,
            vertical: DsSpacing.sm,
          ),
          content: _Content(message: message, variant: variant),
        ),
      );
  }
}

class _Content extends StatelessWidget {
  const _Content({required this.message, required this.variant});

  final String message;
  final DsToastVariant variant;

  Color get _badgeColor => switch (variant) {
        DsToastVariant.success => DsColors.ok,
        DsToastVariant.error => DsColors.urgent,
      };

  IconData get _iconData => switch (variant) {
        DsToastVariant.success => Icons.check_rounded,
        DsToastVariant.error => Icons.warning_amber_rounded,
      };

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: DsToast._badgeSize,
          height: DsToast._badgeSize,
          decoration: BoxDecoration(color: _badgeColor, shape: BoxShape.circle),
          child: Icon(_iconData, color: Colors.white, size: 18),
        ),
        const SizedBox(width: DsSpacing.md),
        Flexible(
          child: Text(
            message,
            style: DsTypography.bodyMd.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
