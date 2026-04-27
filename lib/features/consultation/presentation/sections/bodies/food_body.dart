import 'package:flutter/material.dart';
import 'package:vet_app/design_system/atoms/ds_dropdown.dart';
import 'package:vet_app/features/consultation/presentation/sections/bodies/section_options.dart';

class FoodBody extends StatelessWidget {
  const FoodBody({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final String? value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return DsDropdown<String>(
      label: 'Régimen alimentario',
      hint: 'Seleccionar…',
      value: value,
      options: SectionOptions.food,
      onChanged: onChanged,
    );
  }
}
