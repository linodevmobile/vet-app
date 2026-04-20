import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

class DsIconButton extends StatelessWidget {
  const DsIconButton({
    required this.icon,
    required this.onTap,
    this.size = 36,
    this.iconSize = 16,
    this.iconColor = DsColors.ink60,
    super.key,
  });

  final IconData icon;
  final VoidCallback onTap;
  final double size;
  final double iconSize;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: DsColors.surface,
      borderRadius: BorderRadius.circular(DsRadii.r2),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(DsRadii.r2),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(DsRadii.r2),
            border: Border.all(color: DsColors.line),
          ),
          alignment: Alignment.center,
          child: Icon(icon, size: iconSize, color: iconColor),
        ),
      ),
    );
  }
}
