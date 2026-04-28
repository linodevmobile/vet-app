import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

class DsLoadingView extends StatelessWidget {
  const DsLoadingView({
    this.padding = const EdgeInsets.symmetric(vertical: DsSpacing.xxl),
    this.size = 24,
    super.key,
  });

  final EdgeInsetsGeometry padding;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Center(
        child: SizedBox(
          width: size,
          height: size,
          child: const CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }
}
