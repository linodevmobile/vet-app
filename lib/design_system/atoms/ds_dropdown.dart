import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/ds_colors.dart';

class DsDropdown<T> extends StatelessWidget {
  const DsDropdown({
    required this.value,
    required this.options,
    required this.onChanged,
    this.label,
    this.hint,
    this.labelBuilder,
    this.enabled = true,
    super.key,
  });

  final T? value;
  final List<T> options;
  final ValueChanged<T> onChanged;
  final String? label;
  final String? hint;
  final String Function(T)? labelBuilder;
  final bool enabled;

  String _label(T item) =>
      labelBuilder != null ? labelBuilder!(item) : item.toString();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: DsColors.ink80,
            ),
          ),
          const SizedBox(height: 6),
        ],
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: DsColors.surface,
            border: Border.all(color: DsColors.ink20),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              isExpanded: true,
              hint: hint == null
                  ? null
                  : Text(
                      hint!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: DsColors.ink40,
                      ),
                    ),
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: DsColors.ink60,
              ),
              style: const TextStyle(fontSize: 14, color: DsColors.ink),
              items: options
                  .map(
                    (o) => DropdownMenuItem<T>(
                      value: o,
                      child: Text(_label(o)),
                    ),
                  )
                  .toList(),
              onChanged: enabled
                  ? (v) {
                      if (v != null) onChanged(v);
                    }
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
