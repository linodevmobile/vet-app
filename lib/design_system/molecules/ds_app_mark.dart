import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

enum DsAppMarkSize { sm, md, lg }

class DsAppMark extends StatelessWidget {
  const DsAppMark({
    this.size = DsAppMarkSize.md,
    super.key,
  });

  final DsAppMarkSize size;

  double get _iconBox => switch (size) {
        DsAppMarkSize.sm => 28,
        DsAppMarkSize.md => 36,
        DsAppMarkSize.lg => 44,
      };

  double get _iconInner => _iconBox * 0.6;

  TextStyle get _wordmarkStyle => switch (size) {
        DsAppMarkSize.sm => DsTypography.displaySm,
        DsAppMarkSize.md => DsTypography.displayMd,
        DsAppMarkSize.lg => DsTypography.displayLg,
      };

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: _iconBox,
          height: _iconBox,
          decoration: BoxDecoration(
            color: DsColors.primary,
            borderRadius: BorderRadius.circular(DsRadii.r2),
          ),
          child: Center(
            child: SvgPicture.asset(
              DsAssets.appIcon,
              width: _iconInner,
              height: _iconInner,
            
            ),
          ),
        ),
        const SizedBox(width: DsSpacing.sm),
        Text('VetApp', style: _wordmarkStyle),
      ],
    );
  }
}
