import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vet_app/design_system/tokens/ds_colors.dart';

class DsMiniInput extends StatelessWidget {
  const DsMiniInput({
    required this.controller,
    required this.label,
    this.unit,
    this.keyboardType = const TextInputType.numberWithOptions(decimal: true),
    this.inputFormatters,
    this.onChanged,
    super.key,
  });

  final TextEditingController controller;
  final String label;
  final String? unit;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            fontFamily: 'monospace',
            fontSize: 10,
            letterSpacing: 0.5,
            color: DsColors.ink60,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: DsColors.surface,
            border: Border.all(color: DsColors.ink20),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: keyboardType,
                  inputFormatters: inputFormatters,
                  onChanged: onChanged,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: DsColors.ink,
                  ),
                  decoration: const InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              if (unit != null) ...[
                const SizedBox(width: 4),
                Text(
                  unit!,
                  style: const TextStyle(
                    fontSize: 11,
                    color: DsColors.ink60,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
