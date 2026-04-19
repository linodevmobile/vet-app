import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/patients/domain/entities/species.dart';

enum DsPetAvatarShape { circle, rounded }

class DsPetAvatar extends StatelessWidget {
  const DsPetAvatar({
    required this.species,
    this.size = 44,
    this.urgent = false,
    this.shape = DsPetAvatarShape.rounded,
    super.key,
  });

  final Species species;
  final double size;
  final bool urgent;
  final DsPetAvatarShape shape;

  BoxDecoration _decoration(Color bg) {
    final border = urgent
        ? Border.all(color: DsColors.urgent.withValues(alpha: 0.35))
        : null;

    return switch (shape) {
      DsPetAvatarShape.circle => BoxDecoration(
          color: bg,
          shape: BoxShape.circle,
          border: border,
        ),
      DsPetAvatarShape.rounded => BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(DsRadii.r2),
          border: border,
        ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final bg = urgent ? DsColors.urgentSoft : DsColors.primarySoft;
    final fg = urgent ? DsColors.urgent : DsColors.primaryInk;

    return Container(
      width: size,
      height: size,
      decoration: _decoration(bg),
      alignment: Alignment.center,
      child: SvgPicture.asset(
        species.asset,
        width: size * 0.55,
        height: size * 0.55,
        colorFilter: ColorFilter.mode(fg, BlendMode.srcIn),
      ),
    );
  }
}
