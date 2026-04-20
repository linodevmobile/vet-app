import 'package:flutter/material.dart';
import 'package:vet_app/design_system/atoms/ds_icon_button.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

class DsScreenHeader extends StatelessWidget {
  const DsScreenHeader({
    required this.title,
    this.onBack,
    this.trailing,
    super.key,
  });

  final String title;
  final VoidCallback? onBack;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (onBack != null) ...[
          DsIconButton(icon: Icons.arrow_back, onTap: onBack!),
          const SizedBox(width: DsSpacing.md),
        ],
        Expanded(
          child: Text(
            title,
            style: DsTypography.titleLg,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (trailing != null) ...[
          const SizedBox(width: DsSpacing.sm),
          trailing!,
        ],
      ],
    );
  }
}
