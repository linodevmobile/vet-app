import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

class DsAvatarInitials extends StatelessWidget {
  const DsAvatarInitials({
    required this.initials,
    this.size = DsSpacing.avatarMd,
    super.key,
  });

  final String initials;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: DsColors.primarySoft,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: DsTypography.titleSm.copyWith(color: DsColors.primaryInk),
      ),
    );
  }
}
