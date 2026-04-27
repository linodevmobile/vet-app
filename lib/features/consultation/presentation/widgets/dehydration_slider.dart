import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/ds_colors.dart';

class DehydrationSlider extends StatelessWidget {
  const DehydrationSlider({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final double value;
  final ValueChanged<double> onChanged;

  Color get _color {
    if (value < 5) return DsColors.ok;
    if (value < 8) return DsColors.warn;
    return DsColors.urgent;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'Deshidratación',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: DsColors.ink80,
                ),
              ),
            ),
            Text(
              '${value.toStringAsFixed(0)}%',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: _color,
              ),
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: _color,
            inactiveTrackColor: DsColors.surfaceAlt,
            thumbColor: _color,
            overlayColor: _color.withValues(alpha: 0.12),
            trackHeight: 4,
          ),
          child: Slider(
            value: value.clamp(0, 12),
            max: 12,
            divisions: 12,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
